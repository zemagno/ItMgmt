class RelatorioController < ApplicationController
   layout 'relatorio' 
   
  def index
    authorize!(:index, Cadrelatorio)   
    sql = Cadrelatorio.find_by_nome(params[:id]).consulta
    puts sql
    mysql_res = ActiveRecord::Base.connection.execute(sql)

    @resultado = []

    mysql_res.each{ |res| @resultado << res }

    @campos = mysql_res.fields

    puts @campos
    puts @resultado

    respond_to do |format|
      format.html # index.html.erb
    end
  end
end