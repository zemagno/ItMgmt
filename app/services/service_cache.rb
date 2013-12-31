class ServiceCache

	# usar rails cache, que por sua vez, aponta para redis
	# leia problema com redis e cache em http://stackoverflow.com/questions/4221735/rails-and-caching-is-it-easy-to-switch-between-memcache-and-redis
	# 
	# 
	# criar tokens com tipos de cache
	# criar self classes para responder a esses tokens 
	#    Cache.limparHeranca
	#  
	#    
	#  def self.LimpaHeranca
	#     limpar do cache (ou expirar)
	#   end
	#  
	#  def self.getHeranca
	#    se expirou ou se nao existe, ler 
	#    armazenar no cache
	#  end  
end



# if Rails.cache.exist?("#{direcao}-#{@ci.id}")
#        @fila_resultado = Rails.cache.read("#{direcao}-#{@ci.id}")
#        @email_impactados = Rails.cache.read("#{direcao}-#{@ci.id}-email")
#        logger.debug  "Ops... li do cache"
# else
