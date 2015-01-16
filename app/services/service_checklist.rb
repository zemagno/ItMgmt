
require "queueable"
class ServiceChecklist

	# TODO - crise de identidade... servicechecklist será instanciado ??
	# recebe um Model Checklist ou um InitChecklist 

	include Queueable
	def initialize(_execchecklist)
		# esse checklist poderá ser um ExecChecklist ou um InitChecklist
		@execchecklist = _execchecklist
		@itens_checklist = nil
	end 


    def MontaTreeTickets(cl, tipo_ticket)
    	# navego pelos pais (que herdarao os itens)
    	# depois navego pelo superpais (que serão tickets independentes)
    	# devolvo um array com o [ticket mastes, superpai,superpai,superpai]


    	queue = []
    	checklist_visitado = Hash.new
    	
    	ticket = {tipo: tipo_ticket, titulo: cl.titulo, descricao: cl.descricao, users: cl.users, comentarios: [] }
    	
    	queue.push(cl)
    	cl.pais.map { |x| queue.push(x)}
    
    	puts queue
        
		comentarios = []
		while not queue.empty?
			checklist = queue.shift
			if not checklist_visitado[checklist.id] then 
            	checklist_visitado[checklist.id] = true
 	   			checklist.itens_checklists.map do |x| 
	       			comment = x.descricao
	       			comment << " CIs: #{x.cis}" if ! x.cis.blank?
	       			comment << " Resp: #{x.users}" if ! x.users.blank?
	       			comentarios << comment 
	  
	       		end
	       	end
	       	checklist.pais.map { |x| queue.push(x)}
        end
     
        ticket[:comentarios] = comentarios

        tickets = [ticket]
        #puts ">>>>> #{jira[0].descricao} #{comentarios}"
        cl.superpais.map do |x| 
        	MontaTreeTickets(x, :superpai).each do |tkt|
        		tickets << tkt
        	end
        end
        
        tickets
    end

	def IniciarChecklist 
		# inicia um checklist, criando um exec_checklist e iniciando uma tarefa no sidekiq
		# com isso, eu devolvo o controle logo para a pagina e depois assincronamete, eu vou criando os itens no db e no jira
	    
	    # TODO falta tipoci_id
	    # criar itens
	    # enfilerar no sidekiq para abrir os tickets

	    exec_checklist = ExecChecklist.new
	    exec_checklist.descricao = @execchecklist.descricao
	    exec_checklist.titulo = @execchecklist.titulo

	    #se existir CI e nao estiver na descricao, adiciono.
	    # esse @execchecklist é na verdade o initchecklist
	    exec_checklist.titulo << " - #{@execchecklist.cis}"  unless @execchecklist.cis.blank? || exec_checklist.titulo.include?(@execchecklist.cis)
	    exec_checklist.users = @execchecklist.users
	    exec_checklist.cis = @execchecklist.cis
	    exec_checklist.alias = @execchecklist.alias
	    exec_checklist.inicioexec = @execchecklist.inicioexec
	    exec_checklist.fimexec = @execchecklist.fimexec
	    exec_checklist.abrir_ticket = @execchecklist.abrir_ticket
	    exec_checklist.checklist_id = @execchecklist.checklist_id	    
	    exec_checklist.status_checklist_id = STATUS_JIRA_INICIANDO
	     
	    exec_checklist.save

	    IniciarChecklist.perform_async(exec_checklist.id)
	    exec_checklist.id
  	end

	def CriarTickets
		tickets = MontaTreeTickets(@execchecklist.checklist, :master)
		ticketpai = nil
		tickets.each do |t|
			ticket = Jira.new
			if t[:tipo] == :master
				ticket.create_ticket({:titulo => @execchecklist.titulo, 
			       	 				  :itens => t[:comentarios].join("\r\n"), 
			      					  :responsavel =>  @execchecklist.users }) 
			    # TODO colocar trap de erro aqui..  					  	
				ticketpai = ticket.ticket.key
			elsif t[:tipo] == :superpai
				ticket.create_sub_tarefa({:titulo => t[:titulo], 
			       	 				 	  :itens => t[:comentarios].join("\r\n"), 
			      					 	  :responsavel => @execchecklist.users,
			      					 	  :ticket_pai => ticketpai })	
			end
		end
		ticketpai
	end

	def GerarItens
		#navegar pelos comentario
		#criar uma super lista, atentando para nao duplicar comentario de dois pais iguais 
		#   (a --> gmud, b--> a,gmud)
		#   aqui eu posso compactar, pois qq coisa do tipo "negociou com impactados", 
		#   tem que pesquisar nos impactados de todos os CIs.
		#   colocar botao para impactados do CI cadastrado.
		concatencar comentarios
	end



	# TODO finalizar CriacaoChecklist
	# TODO FinalizarCriacaoChecklist- se status nao for 4, log de erro
	# TODO FinalizarCriacaoChecklist- formulario com os parametros dinamico do jira, armazenados no Params do exec.
	# 
	# TODO FinalizarCriacaoChecklist- verificar se é somente checklist ou abrir ticket tb
	# TODO - se ja existir um jira no CI, coloca no final e adiciona no comentario do jira pai
 	#        se nao existir um jira, coloca no inicio.
    # @execchecklist.cis.split(",") do |c|
    # 	ci = Ci.find_gen(c)
    	# ci.jira << "#{execchecklist.alias}|#{ticketpai},#{ci.jira}" unless ci.nil?
    # end
    # atualizar data de mudanca do CI.
    # Se existir um jira do criacao, adicionar a esse jira de criacao 
    #    (historico de servidor e link)	

	def FinalizarCriacaoChecklist
		if @execchecklist.abrir_ticket
			ticketpai = CriarTickets()
			@execchecklist.tickets = ticketpai
		else

		end
		
		@execchecklist.status_checklist_id = STATUS_JIRA_ABERTO
		@execchecklist.save		
	 
		{:ticket => ticketpai}


	 
	end

	def print
		p @execchecklist
		p @itens_novos_ticket
		p @itens_comentarios
	end
end
=begin
    id = 7
  	cl = ExecChecklist.find(id)
  	sc = ServiceChecklist.new(cl)
  	ticket = sc.FinalizarCriacaoChecklist
=end