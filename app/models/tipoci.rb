# Encoding: utf-8
class Tipoci < ActiveRecord::Base
  attr_accessible :Descricao, :tipo, :Owner, :perfil, :tab
  has_many :dicdados

  default_scope { order('tipo ASC') }
  

  OWNER_SCREEN_SIZE = 20
  OWNER_MAX_LENGTH = 20

  after_save :limpa_cache

  validates :tipo, :uniqueness => {:case_sensitive => false, :message => "Ja existe esse tipo."}


  #def to_s
  #		puts "#{tipo}:#{Owner}"

  #end
  private
  def limpa_cache
    Rails.cache.delete_matched("ability*")
  end

end
