class Statusci < ActiveRecord::Base

  after_commit :flush_cache 

  attr_accessible :status, :icon, :parametro

  validates :status, :presence => {:message => I18n.t("errors.statusci.presence") }
  validates :status, :uniqueness => {:case_sensitive => false, :message => I18n.t("errors.statusci.uniqueness") }


  belongs_to :ci

  def self.cached_find(id)
  	Rails.cache.fetch([name, id]) { find(id) }
  end

  def flush_cache
   	Rails.cache.delete([self.class.name, id])
  end

 end
