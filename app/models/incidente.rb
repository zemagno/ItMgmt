class Incidente < ActiveRecord::Base
  attr_accessible :nome, :chamados, :ci, :ci_descricao, :ci_id, :criticidade, :data_fim_evento, :data_inicio_evento, :descricao, :descricao_solucao, :evento_publico, :impactados, :incidente_tipo_impacto_id, :info_restrita, :perc_impactados, :perda_sla, :site, :solicitante, :status, :tempo_dentro_sla, :tempo_target_sla, :tipo_incidente, :total_impactados, :usuario

  belongs_to :ci

  def criado_em
    created_at.in_time_zone("Brasilia").strftime("%d/%m-%H:%M")
  end

  def alterado_em
    updated_at.in_time_zone("Brasilia").strftime("%d/%m-%H:%M")
  end

  # define_index do
  #   indexes nome
  #   indexes descricao
  #   indexes descricao_solucao
  #   indexes tipo_incidente
  #   indexes status
  #   indexes criticidade
  #   indexes solicitante
  #   indexes ci(:chave), :as => :CI
  #   indexes ci_id
  #   indexes :Ativo
  # end

end
