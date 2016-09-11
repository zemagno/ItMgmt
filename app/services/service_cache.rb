class ServiceCache


    # TODO desenvolver ServiceCache
	# usar rails cache, que por sua vez, aponta para redis
	# leia problema com redis e cache em http://stackoverflow.com/questions/4221735/rails-and-caching-is-it-easy-to-switch-between-memcache-and-redis
	# 
	# 
	# ???? o que é melhor...definir um ServiceCache ou um Cacheable ?????????
	#   Comecar com cacheable(mais facil e rapido)..e depois ver se migra para serviceCache..
	#   a vantagem do Service é que implementa servico de expiracao ao ser alterado (inclusao de dependente)
	#   no cacheable, eu tenho que ficar testando.
	#   no ServiceCache, eu notifico e o service decide se é melhor. (expirar um, todos0)
	# 
	# criar tokens com tipos de cache
	# definir self classes para responder a esses tokens 
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
	# 
	# tarefas automaticas a noite para gerar todos os caches....????



end



# if Rails.cache.exist?("#{direcao}-#{@ci.id}")
#        @fila_resultado = Rails.cache.read("#{direcao}-#{@ci.id}")
#        @email_impactados = Rails.cache.read("#{direcao}-#{@ci.id}-email")
# else
