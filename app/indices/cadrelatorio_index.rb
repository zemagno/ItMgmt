ThinkingSphinx::Index.define :cadrelatorio, :with => :real_time do
    indexes nome, :type => :string
    indexes descricao, :type => :string
    indexes categoria, :type => :string
    indexes dashboard, :type => :string
    indexes nice_tipoci, :as => :tipo, :type => :string
  end
