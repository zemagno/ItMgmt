ThinkingSphinx::Index.define :audit, :with => :real_time do
      indexes action , :as => :oque, :type => :string
      indexes user_name, :as => :quem, :type => :string
      indexes auditable_id, :as => :onde, :type => :integer
      indexes auditable_type, :as => :tipoci, :type => :integer
      indexes associated_id, :as => :relacionado, :type => :integer
      indexes audited_changes, :as => :detalhe, :type => :integer
  end