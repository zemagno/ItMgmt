class User < ActiveRecord::Base
  attr_accessible :nomes, :roles, :login
  def self.from_omniauth(auth)
    puts "Auth --> #{auth}"
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end
  
  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["email"]
      user.roles = "usuario"
    end
  end


  after_save :limpa_cache

  def is_a (role)
    roles.include? role.to_s
  end

  private
  def limpa_cache
    Rails.cache.delete_matched("ability*")
  end
end
