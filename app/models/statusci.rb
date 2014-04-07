class Statusci < ActiveRecord::Base

  after_commit :flush_cache 

  attr_accessible :status, :icon, :parametro

  belongs_to :ci

  def self.cached_find(id)
  	Rails.cache.fetch([name, id]) { find(id) }
  end

  def flush_cache
   	Rails.cache.delete([self.class.name, id])
  end

 end
