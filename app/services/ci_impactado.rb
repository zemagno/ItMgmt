require "queueable"

class CiImpactado

	# TODO ler impactados durante o init e colocar no memcached.
	# Se ao inicializar, ainda estiver no memcached, nao navegar tudo.
	# 
	include Queueable
	def initialize(id)
		@id = id
	end 

	def impactado
		direcao = :impactados
		ci = Ci.find(@id)
	    email_impactados = ""
	    init_queue
	    email_impactados << ci.Owner unless ci.Owner == ""

	    enqueue([ci,0])
	    edges_visitado = Hash.new

	    nivel_max = 8
	    nivel_max_email = 8

	    fila_resultado = []

	    while not queue_empty?
	      #retira (e retorna) o primeiro elementro da fila ([impactado, nivel])
	      i,nivel = dequeue
	      if nivel <= nivel_max then
	          if not edges_visitado[i.chave] then        
	              edges_visitado[i.chave] = true
	              email_impactados << ","+i.Owner unless i.Owner.nil? or i.Owner == "" or nivel>nivel_max_email
	              fila_resultado << [:ci,i] unless i.send(direcao).empty?
	              i.send(direcao).each do |ii|
	                  fila_resultado << [:subci,ii, "Depende de"]
	              end
	          end    

	        # retorna uma matrix com varios elementos (.map)
	        # transforma cada elemento impactado numa tupla com [impactado, nivel + 1]
	        # concatena essas tuplas de impactados no final da fila

	        i.send(direcao).map { |x| enqueue([x,nivel+1])}
	      end
	    end
	    email_impactados = ListaEmail.acerta(email_impactados,"@brq.com")
	    [fila_resultado, email_impactados]
	end

	def init_cis(cis)
		@cis = cis
	end

	def gera_relacionamentos
		direcao = :impactados
		email_impactados = ""
	    init_queue


	    @cis.map do  |x| 
	    	ci = Ci.find(x)
	        enqueue([ci,0])
	        puts ci
	     	email_impactados << ci.Owner unless ci.Owner.nil? or ci.Owner == ""	
	    end        
	    # por ora, nao esta gerando a lista inicial de email TODO

	    edges_visitado = Hash.new

	    # TODO aumentar nivel para 30, 40--- pode nao chegar ate o nivel cliente ou ambiente, com owner(diretor)
	    nivel_max = 20
	    nivel_max_email = 20

	    fila_resultado = []

	    while not queue_empty?
	      #retira (e retorna) o primeiro elementro da fila ([impactado, nivel])
	      i,nivel = dequeue
	      puts "vou navegar pelo #{i.chave}"
	   
	      if nivel <= nivel_max then
	          if not edges_visitado[i.chave] then        
	              edges_visitado[i.chave] = true
	              email_impactados << ","+i.Owner unless i.Owner.nil? or i.Owner == "" or nivel>nivel_max_email
	              fila_resultado << [:ci,i] unless i.send(direcao).empty?
	              i.send(direcao).each do |ii|
	                  fila_resultado << [:subci,ii, "Depende de"]
	              end
	          end    

	        # retorna uma matrix com varios elementos (.map)
	        # transforma cada elemento impactado numa tupla com [impactado, nivel + 1]
	        # concatena essas tuplas de impactados no final da fila

	        i.send(direcao).map { |x| enqueue([x,nivel+1])}
	      end
	    end
	    email_impactados = ListaEmail.acerta(email_impactados,"@brq.com")
	    [fila_resultado, email_impactados]
	end
end