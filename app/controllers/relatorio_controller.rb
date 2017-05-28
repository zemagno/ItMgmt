require 'action_controller/metal/renderers'
require 'csv'




ActionController.add_renderer :csv do |csv, options|
  self.response_body = csv.respond_to?(:to_csv) ? csv.to_csv(options) : csv
end

#require 'nokogiri'
class RelatorioController < ApplicationController
  # layout 'relatorio'
  #authorize_resource

    before_filter :authenticate_user!, :except => :index_publico

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


  def executa_relatorio
    begin
      regexParams = /\{([a-z]+)}/
      @tipoExibicoes = [[0,0],[1,600],[2,500],[3,400],[4,300],[5,200],[6,100]]
       # TODO jogar esse array para um helper..

      @relatorio = Cadrelatorio.find_by_nome(params[:id])
      @relatorio.AtualizaEstatisticas
      puts "vou procurar @p"
      @px = @tipoExibicoes[@relatorio.tipoExibicao]
      puts "___________________________"
      puts @px
      puts "___________________________"

      sql = @relatorio.consulta
      sql.gsub!(regexParams) {|s| params[s[1..-2]]}
      # if sql.match(/{/)
      #   flash[:notice] = "SQL Invalido"
      #   redirect_to tasks_url and return
      # end
      # se sql tiver parametros e esses parametros nao estiverem no params do http, desviar para pagina de perguntar parametros
      # faco replace do sql com os params recebidos
      #
      @NomeRelatorio = @relatorio.descricao

      start = Time.now
      mysql_res = ActiveRecord::Base.connection.execute("SET SESSION group_concat_max_len = 10000;")
      mysql_res = ActiveRecord::Base.connection.execute(sql)
      finish = Time.now
      Rails.logger.debug "[DEBUG]Relatorio.execucao: #{@relatorio.nome} - Exec time #{finish-start} segundos"
      @resultado = []
      mysql_res.each{ |res| @resultado << res }
      @campos = mysql_res.fields
      puts "Tamanho do relatorio: #{Marshal::dump(@resultado).size}"
    rescue => error
      puts error.backtrace
      @resultado = [["Consulta com erro de SQL..."]]
      @campos = ["Status"]
    ensure
      # this_code_will_execute_always()
    end
  end

  def index_publico
    executa_relatorio
    to_xml(params[:id],@campos,@resultado)
    @publico = true
    respond_to do |format|
      # format.html { render :index, layout: 'relatorio'}
      if @px[0] == 0
         format.html { render "index", layout: 'relatorio'}
      else
         format.html { render "index-cards", layout: 'relatorio'}
      end
      format.xml { render :xml => to_xml(params[:id],@campos,@resultado) }
      format.csv { render :csv => to_csv(params[:id],@campos,@resultado) }
    end
  end


  def index
    authorize!(:index, "relatorio")
    executa_relatorio
    to_xml(params[:id],@campos,@resultado)
    @publico = false
    puts "___________________________"
    puts @px
    puts "___________________________"
    respond_to do |format|
      if @px[0] == 0
         format.html { render "index"}
      else
         format.html { render "index-cards"}
      end
      format.xml  { render :xml => to_xml(params[:id],@campos,@resultado) }
      format.csv  { render :csv => to_csv(params[:id],@campos,@resultado) }
    end
  end
end


# @relatorio = Cadrelatorio.find(395)
# sql = @relatorio.consulta
# @NomeRelatorio = @relatorio.descricao
# mysql_res = ActiveRecord::Base.connection.execute("SET SESSION group_concat_max_len = 10000;")
# mysql_res = ActiveRecord::Base.connection.execute(sql)
# @resultado = []
# mysql_res.each{ |res| @resultado << res }
# @campos = mysql_res.fields
# puts "Tamanho do relatorio: #{Marshal::dump(@resultado).size}"


# Rails.cache.write("relatorio/projetos",@resultado)


#require "Builder"

#builder = Builder::XmlMarkup.new(:target=>STDOUT, :indent=>2)
#builder.person { |b| b.fname("foo"); b.lname("bar") }
