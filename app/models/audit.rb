class Audit < ActiveRecord::Base
  #include ThinkingSphinx::Scopes
 

  belongs_to :user
  attr_accessible :action, :auditable_id, :auditable_type, :comment, :remote_address, :user_type, :username, :version

  default_scope { order('created_at DESC') }

  after_save ThinkingSphinx::RealTime.callback_for(:audit)

  def user_name
     (user.blank? ? "Indefinido" : user.internal_login)
  end

end
