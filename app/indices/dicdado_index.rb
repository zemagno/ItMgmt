ThinkingSphinx::Index.define :dicdado, :with => :active_record do
    indexes nome, :as => :campo
    indexes apelido
    indexes valores
    indexes tipoci(:tipo), :as => :tipo
    indexes tipoci_id, :as => :tipoci_id, :sortable => true
    indexes ordem , :as => :ordem, :sortable => true
  end