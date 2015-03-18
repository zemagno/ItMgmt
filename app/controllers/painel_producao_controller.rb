class PainelProducaoController < ApplicationController
  def index
  	@painel = []
  	Cadrelatorio.find_all_by_painel(1).each do |c|
		begin
            sql_res = ActiveRecord::Base.connection.execute(c.consulta)
            @painel << [c.nome,c.descricao,sql_res.count]
        rescue
			 @painel << [c.nome,c.descricao,"Consulta com Erro"]
	  	end
	end
  end
end
# l = painel.map { |x| [x.id,x.nome,x.consulta,0] }
