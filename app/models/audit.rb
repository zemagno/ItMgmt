class Audit < ActiveRecord::Base

  #include ThinkingSphinx::Scopes

  belongs_to :user
  attr_accessible :action, :auditable_id, :auditable_type, :comment, :remote_address, :user_type, :username, :version

  #default_scope order('created_at DESC')

  #include ThinkingSphinx::Scopes

  #sphinx_scope(:data_criacao) { {:order => :created_at} }
  #default_sphinx_scope :data_criacao

  def user_name
     (user.blank? ? "Indefinido" : user.name)
  end

  define_index do
      indexes action , as => :oque
      indexes user(:name), as => :quem
      indexes auditable_id, as => :onde
      indexes auditable_type, as => :tipoci
      indexes associated_id, as => :relacionado
  end
end
