# ThinkingSphinx::Index.define :cadrelatorio, :with => :real_time do
ThinkingSphinx::Index.define :cadrelatorio, :with => :active_record do
    indexes nome, :type => :string
    indexes descricao, :type => :string
    indexes categoria, :type => :string
    indexes dashboard, :type => :string
    indexes tipoci(:tipo), :as => :tipoci
  end