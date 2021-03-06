class SqlTemplate < ActiveRecord::Base
  attr_accessible :body, :format, :handler, :locale, :partial, :path
	validates :body, :path, :presence => true
	validates :format, :inclusion => Mime::SET.symbols.map(&:to_s) 
	validates :locale, :inclusion => I18n.available_locales.map(&:to_s) 
	validates :handler, :inclusion =>
           ActionView::Template::Handlers.extensions.map(&:to_s)


  def self.find_gen(param)
    begin
      if param =~ /^[1-9]*$/
        SqlTemplate.find(param)
      else
      	SqlTemplate.find_by_path(param)
      end
    rescue ActiveRecord::RecordNotFound
      SqlTemplate.find_by_path(param)
    end
  end       

	class Resolver < ActionView::Resolver 
	   protected
		def find_templates(name, prefix, partial, details,dump)

			conditions = { 
				:path => normalize_path(name, prefix),
				:locale => normalize_array(details[:locale]).first,
				:format => normalize_array(details[:formats]).first,
				:handler => normalize_array(details[:handlers]),
				:partial => partial || false
			}
			::SqlTemplate.where(conditions).map do |record|
				initialize_template(record)
			end
		end

		# Normalize name and prefix, so the tuple ["index", "users"] becomes 
		# "users/index" and the tuple ["template", nil] becomes "template". 
		def normalize_path(name, prefix)
			prefix.present? ? "#{prefix}/#{name}" : name
		end 
		def normalize_array(array) 
			array.map(&:to_s)
		end

		# Initialize an ActionView::Template object based on the record found.
		def initialize_template(record) 
			source = record.body 
			identifier = "SqlTemplate - #{record.id} - #{record.path.inspect}" 
			handler = ActionView::Template.registered_template_handler(record.handler)
			details = { 
				:format => Mime[record.format], 
				:updated_at => record.updated_at, 
				:virtual_path => virtual_path(record.path, record.partial)
			} 
			ActionView::Template.new(source, identifier, handler, details)
		end
		
		# Make paths as "users/user" become "users/_user" for partials.
		def virtual_path(path, partial) 
			return path unless partial 
			if index = path.rindex("/")
				path.insert(index + 1, "_")
			else
				"_#{path}"
			end 
		end
	end

	def self.create_or_update(template,body="")
		novo = find_or_create_by(:path => "ci_mailer/#{template}")
		# novo.pa = template
		novo.body = body
		novo.format = "html"
		novo.locale = "en"
		novo.handler = "erb"
		novo.partial = 0
		novo.save 
		novo
	end

end
