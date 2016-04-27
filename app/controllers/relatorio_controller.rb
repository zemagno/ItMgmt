  require 'action_controller/metal/renderers'
  require 'csv'


ActionController.add_renderer :csv do |csv, options|
  self.response_body = csv.respond_to?(:to_csv) ? csv.to_csv(options) : csv
end

#require 'nokogiri'
class RelatorioController < ApplicationController
  layout 'relatorio' 
   #authorize_resource

  def to_xml (titulo, header, _fields)
    builder = Nokogiri::XML::Builder.new do |xml|
      # xml.root {
      #   xml.products {
      #     xml.widget {
      #       xml.id_ "10"
      #       xml.name "Awesome widget"
      #     }
      #   }
      # }
      titulo.gsub!(/[^0-9A-Za-z.\-]/, '_')
      header.each{|i| i.gsub!(/[^0-9A-Za-z.\-]/, '_')}
      xml.send(titulo.pluralize) {
        _fields.size.times do |f|
          xml.send(titulo) {
            header.size.times do |h|
              xml.send(header[h],_fields[f][h]) 
            end
          }
        end
      }
    end
    
    builder.to_xml
  end

  def to_csv (titulo, header, _fields)
    csv_string = CSV.generate do |csv|
      csv << header
      _fields.each { |res| csv << res }
    end
    csv_string
  end


  def index
    puts params
    regexParams = /\{([a-z]+)}/
    authorize!(:index, "relatorio")   
    @relatorio = Cadrelatorio.find_by_nome(params[:id])
    @relatorio.AtualizaEstatisticas
    sql = @relatorio.consulta
    sql.gsub!(regexParams) {|s| params[s[1..-2]]}
    puts sql
    if sql.match(/{/)
      flash[:notice] = "SQL Invalido"
      redirect_to tasks_url and return
    end 
    # se sql tiver parametros e esses parametros nao estiverem no params do http, desviar para pagina de perguntar parametros
    # faco replace do sql com os params recebidos
    # 
    @NomeRelatorio = @relatorio.descricao
  
    begin
      mysql_res = ActiveRecord::Base.connection.execute(sql)
      @resultado = []
      mysql_res.each{ |res| @resultado << res }
      @campos = mysql_res.fields
    rescue
      @resultado = [["Consulta com erro de SQL..."]]
      @campos = ["Status"]
    ensure 
      # this_code_will_execute_always()
    end
    
    to_xml(params[:id],@campos,@resultado)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => to_xml(params[:id],@campos,@resultado) }  
      format.csv { render :csv => to_csv(params[:id],@campos,@resultado) }  
    end
  end
end


#require "Builder"

#builder = Builder::XmlMarkup.new(:target=>STDOUT, :indent=>2)
#builder.person { |b| b.fname("foo"); b.lname("bar") }