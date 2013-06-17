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

    @campos = mysql_res.fields

    puts @campos
    puts @resultado

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @campos+@resultado }  
    end
  end
end