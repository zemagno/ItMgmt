class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessible :roles,:internal_login

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :default_values

  def default_values
	  self.roles ||= CONFIG["default_role"] || "usuario"
  end       


  def is_a (role)
  	return false if roles.nil?
    roles.include? role.to_s
  end      
end
