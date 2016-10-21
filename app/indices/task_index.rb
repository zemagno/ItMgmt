ThinkingSphinx::Index.define :task, :with => :real_time do
      indexes nome, :type => :string
      indexes description, :type => :string
      indexes chamado, :type => :string
      indexes tipotask, :type => :string
      indexes status, :type => :string
      indexes chave_ci, :as => :CI, :type => :string
      # indexes ci_id, :type => :integer
      indexes :Ativo, :type => :integer
      indexes :nome_criticidade, :type => :string, :as => "criticidade"
  end