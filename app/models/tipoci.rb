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

  class Taby
    def initialize(__tab)
      @tab = __tab
    end
    def name
      @tab
    end
    def id
      @tab
    end
  end

  def tabs
    if !self.tab.blank? && self.tab.include?("Caracteristicas")
      arr =  [] 
    else
     arr = [Taby.new("Caracteristicas")]
    end
    # arr = [Taby.new("Caracteristicas")]
    self.tab.split(",").uniq.each { |label| arr << Taby.new(label) } if ! self.tab.nil?
    arr
  end


  def self.esta_em_uso?(id)
    Ci.where(:tipoci_id => id).exists?
  end

  private
  def limpa_cache
    Rails.logger.debug "[DEBUG]Tipoci:after_save: limpando cache ability*"
    Rails.cache.delete_matched("cache:ability*")
  end

end
