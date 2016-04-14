class Tipoci < ActiveRecord::Base
  attr_accessible :Descricao, :defCampo1, :defCampo2, :defCampo3, :defCampo4, :tipo, :Owner, :perfil
  has_many :dicdados

  default_scope order('tipo ASC')

  OWNER_SCREEN_SIZE = 20
  OWNER_MAX_LENGTH = 20

  after_save :limpa_cache

  #def to_s
  #		puts "#{tipo}:#{Owner}"

  #end
  private
  def limpa_cache
    Rails.cache.delete_matched("ability*")
  end

end
