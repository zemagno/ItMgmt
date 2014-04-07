module Cacheable

  def Cache_write(name, value, options = nil)
    Rails.cache.write(name,value,options)
  end

  def Cache_read(name, options = nil)
    Rails.cache.read(name,options)
  end

  def Cache_exist?(name, options = nil)
    Rails.cache.exist?(name,options)
  end

   def self.cached_find(id)
  	Rails.cache.fetch([name, id]) { find(id) }
  end

  def flush_cache
   	Rails.cache.delete([self.class.name, id])
  end


end