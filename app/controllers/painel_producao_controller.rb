class PainelProducaoController < ApplicationController
  before_filter :authenticate_user!
  def index
    @painel = []
    Cadrelatorio.where("dashboard like \"%#{params[:id]}%\"").each do |c|
      _scope = params[:scope] || "ALL"
      Rails.logger.debug "[DEBUG]PainelProducaoController:index params:#{params} - scope: #{_scope}"
      @nomePainel = params[:id]
      # Cadrelatorio.all.each do |c|
      begin
        # Rails.logger.debug "[DEBUG]PainelProducaoController:index query=#{c}"
        mysql_res = ActiveRecord::Base.connection.execute("SET SESSION group_concat_max_len = 10000;")
        sql_res = ActiveRecord::Base.connection.execute(c.consulta)
        # Rails.logger.debug "[DEBUG]PainelProducaoController:index count=#{sql_res.count}"
        total_record = sql_res.count
        @painel << [c.nome,c.descricao,total_record] if (_scope=="ALL") || (total_record>0)
      rescue
        @painel << [c.nome,c.descricao,"Consulta com Erro"]
      end
    end
  end

end
# l = painel.map { |x| [x.id,x.nome,x.consulta,0] }
