# Encoding: utf-8
class Tipoci < ActiveRecord::Base
  attr_accessible :Descricao, :tipo, :Owner, :perfil, :tab
  has_many :dicdados

  default_scope { order('tipo ASC') }
  

  OWNER_SCREEN_SIZE = 20
  OWNER_MAX_LENGTH = 20

  after_save :limpa_cache

  validates :tipo, :presence => {:message => I18n.t("errors.tipoci.tipo.presence") }
  validates :tipo, :uniqueness => {:case_sensitive => false, :message => I18n.t("errors.tipoci.tipo.uniqueness") }
  validates :perfil, :format => { :with => /\A(?:\w+(?:\[(?:view|edit)\]\s*|\s*|$))*\z/, :message => I18n.t("errors.tipoci.perfil.format") }



  #def to_s
  #		puts "#{tipo}:#{Owner}"

  #end
  private
  def limpa_cache
    Rails.cache.delete_matched("ability*")
  end

end
