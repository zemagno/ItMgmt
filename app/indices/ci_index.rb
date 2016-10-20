ThinkingSphinx::Index.define :ci, :with => :real_time do
  indexes chave, :type => :string
  indexes descricao, :type => :string
  indexes :Owner, :as => :gestor, :type => :string
  indexes notificacao, :as => :usuario, :type => :string
  indexes :CCCredito, :type => :string
  indexes :ProjetoCredito, :type => :string
  indexes :CCDebito, :type => :string
  indexes :ProjetoDebito, :type => :string
  indexes :descricaocobranca, :type => :string
  indexes :codigocobranca, :type => :string
  indexes :codigorateio, :type => :string
  indexes :provisionar, :type => :string
  indexes :tipoCobranca, :type => :string
  indexes jira, :type => :string
  indexes nome_localidade , :as => :site, :type => :strings
  indexes nice_status     , :as => :status, :type => :strings
  indexes nice_tipoci     , :as => :tipo, :type => :strings
  indexes nome_estado     , :as => :estado, :type => :strings
  indexes nice_atributos

  has :tipoci_id, :type => :integer
  # has tipoci.id, :type => :integer

  # group_by "cis.id"
end
