ThinkingSphinx::Index.define :audit, :with => :active_record do
      indexes action , as => :oque
      indexes user(:name), as => :quem
      indexes auditable_id, as => :onde
      indexes auditable_type, as => :tipoci
      indexes associated_id, as => :relacionado
      indexes audited_changes, as => :detalhe
  end