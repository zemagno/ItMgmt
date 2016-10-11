class Audit < ActiveRecord::Base

  #include ThinkingSphinx::Scopes

  belongs_to :user
  attr_accessible :action, :auditable_id, :auditable_type, :comment, :remote_address, :user_type, :username, :version


  def user_name
     (user.blank? ? "Indefinido" : user.name)
  end

end
