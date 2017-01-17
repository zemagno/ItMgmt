class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  attr_accessible :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip,  :roles, :internal_login, :provider, :uid, :name, :password, :password_confirmation, :remember_me

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable ## :async

  before_save :default_values

  def default_values
	  self.roles ||= CONFIG["default_role"] || "usuario"
  end     

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
end 

  def self.from_omniauth(auth)
    puts "self.from_omniauth "
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      puts "criei. Vou armazenar..."
      user.provider = auth.provider
      user.uid = auth.uid
      puts "Login com google: #{auth.info.nickname}"
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,10]
      puts "valid: #{user.valid?}"
      puts "#{user.errors.messages}"
    end
end


 


  def is_a (role)
  	return false if roles.nil?
    roles.include? role.to_s
  end     

  after_save :limpa_cache

  private
    def limpa_cache
      Rails.cache.delete_matched("ability*")
    end 

end
