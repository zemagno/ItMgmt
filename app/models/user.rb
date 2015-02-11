class User < ActiveRecord::Base
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

  #named_scope :with_role, lambda { |role| {:conditions => "roles_mask & #{2**ROLES.index(role.to_s)} > 0 "} }

  # ROLES = %w[admin suporte usuario]

  #def roles=(roles)
  #  self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  #end

  #def roles
  #  ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  #end

  def is_a (role)
    roles.include? role.to_s
  end
end
