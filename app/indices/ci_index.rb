# ThinkingSphinx::Index.define :ci, :with => :active_record do
ThinkingSphinx::Index.define :ci, :with => :active_record do
  indexes chave
  indexes descricao
  indexes :Owner, :as => :gestor
  indexes notificacao, :as => :usuario
  indexes :CCCredito
  indexes :ProjetoCredito
  indexes :CCDebito
  indexes :ProjetoDebito
  indexes :descricaocobranca
  indexes :codigocobranca
  indexes :codigorateio
  indexes :provisionar
  indexes :tipoCobranca
  indexes jira
  indexes site.nome, :as => :localidade
  indexes statusci.status, as => :status
  indexes tipoci.tipo, :as => :tipo
  indexes atributo.valor, :as => :valoratributo
  indexes site.estado, as => :estado
  # indexes site(:nome), :as => :localidade
  # indexes statusci(:status), as => :status
  # indexes tipoci(:tipo), :as => :tipo
  # indexes atributo(:valor), :as => :valoratributo
  # indexes site(:estado), as => :estado
  has :tipoci_id

  # group_by "cis.id"
end
