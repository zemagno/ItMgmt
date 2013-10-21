class RelatorioController < ApplicationController
  layout 'relatorio' 
   #authorize_resource

  def index
    authorize!(:index, "relatorio")   
    relatorio = Cadrelatorio.find_by_nome(params[:id])
    sql = relatorio.consulta
    if sql.match(/(delete|insert|update)/)
      flash[:notice] = "SQL Invalido"
      redirect_to tasks_url and return
      
    end 
    @NomeRelatorio = relatorio.descricao
   
    mysql_res = ActiveRecord::Base.connection.execute(sql)

    @resultado = []

    mysql_res.each{ |res| @resultado << res }

    @campos = mysql_res.fields
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @campos+@resultado }  
    end
  end
end


#require "Builder"

#builder = Builder::XmlMarkup.new(:target=>STDOUT, :indent=>2)
#builder.person { |b| b.fname("foo"); b.lname("bar") }