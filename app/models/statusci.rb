class Statusci < ActiveRecord::Base

  after_commit :flush_cache 

  attr_accessible :status, :icon, :parametro

  validates :status, :presence => {:message => I18n.t("errors.statusci.presence") }
  validates :status, :uniqueness => {:case_sensitive => false, :message => I18n.t("errors.statusci.uniqueness") }


  belongs_to :ci

  def self.cached_find(id)
    begin
  	  Rails.cache.fetch([name, id]) { find(id) }
    rescue
      Rails.logger.error "[ERROR] Statusci: Nao achei o status no cache, provavelmente porque o CI esta sem statusci_id"
      Statusci.first
    end
  end

  def flush_cache
   	Rails.cache.delete([self.class.name, id])
  end

 end
