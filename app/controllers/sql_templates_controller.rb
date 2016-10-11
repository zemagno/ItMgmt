class SqlTemplatesController < InheritedResources::Base
before_action :which_mode
authorize_resource

def templates_async
	arr = []
	TemplatesEmail.where(sync: false).each do |t|
		arr << "ci_mailer/#{t.template}"
	end
	arr	
end


def edit
    @edit_mode = true
	show!
end

def new
	@edit_mode = true
	new!
end

private 
def which_mode
    @edit_mode = false # request.method #.include? ("")
end

helper_method :templates_async

end
