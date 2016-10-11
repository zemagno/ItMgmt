ThinkingSphinx::Index.define :cadrelatorio, :with => :active_record do
    indexes nome
    indexes descricao
    indexes categoria
    indexes dashboard
    indexes tipoci(:tipo), :as => :tipo
  end