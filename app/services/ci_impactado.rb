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
end