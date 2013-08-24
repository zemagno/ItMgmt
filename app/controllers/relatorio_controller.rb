class RelatorioController < ApplicationController
  layout 'relatorio' 
   #authorize_resource

  def index
    authorize!(:index, "relatorio")   
    relatorio = Cadrelatorio.find_by_nome(params[:id])
    sql = relatorio.consulta
    @NomeRelatorio = relatorio.descricao
    puts sql
    mysql_res = ActiveRecord::Base.connection.execute(sql)

    @resultado = []

    mysql_res.each{ |res| @resultado << res }
   
    
    #mysql_res.each do |linha|
    #  linha.each do |campo| 
    #  end
    #end
    # mysql_res.each{ |res| puts res.to_xml }

    @campos = mysql_res.fields

    puts @campos
    puts @resultado

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @campos+@resultado }  
    end
  end
end


#require "Builder"

#builder = Builder::XmlMarkup.new(:target=>STDOUT, :indent=>2)
#builder.person { |b| b.fname("foo"); b.lname("bar") }