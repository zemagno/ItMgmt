class PainelProducaoController < ApplicationController
  def index
  	@painel = []
  	Cadrelatorio.where("dashboard like \"%#{params[:id]}%\"").each do |c|
    _scope = params[:scope] || "ALL"
    # Cadrelatorio.all.each do |c|
		begin

            sql_res = ActiveRecord::Base.connection.execute(c.consulta)
            puts _scope
            puts sql_res.count
            puts (_scope=="ALL") || (sql_res.count>0)
            @painel << [c.nome,c.descricao,sql_res.count] if (_scope=="ALL") || (sql_res.count>0)
        rescue
			 @painel << [c.nome,c.descricao,"Consulta com Erro"]
	  	end
	end
  end

end
# l = painel.map { |x| [x.id,x.nome,x.consulta,0] }
