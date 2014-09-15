
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
    	
    	ticket = {tipo: tipo_ticket, descricao: cl.descricao, users: cl.users, comentarios: [] }
    	
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

	    #se existir CI e nao estiver na descricao, adiciono.
	    # esse @execchecklist é na verdade o initchecklist
	    exec_checklist.descricao << " - #{@execchecklist.cis}"  unless @execchecklist.cis.blank? || exec_checklist.descricao.include?(@execchecklist.cis)
	    exec_checklist.users = @execchecklist.users
	    exec_checklist.cis = @execchecklist.cis
	    exec_checklist.alias = @execchecklist.alias
	    exec_checklist.inicioexec = @execchecklist.inicioexec
	    exec_checklist.fimexec = @execchecklist.fimexec
	    exec_checklist.abrir_ticket = @execchecklist.abrir_ticket
	    exec_checklist.checklist_id = @execchecklist.checklist_id	    
	    exec_checklist.status_checklist_id = 4
	     
	    exec_checklist.save

	    IniciarChecklist.perform_async(exec_checklist.id)
	    exec_checklist.id
  	end
=begin
    id = 7
  	cl = ExecChecklist.find(id)
  	sc = ServiceChecklist.new(cl)
  	ticket = sc.FinalizarCriacaoChecklist
=end



	def FinalizarCriacaoChecklist
# TODO finalizar CriacaoChecklist
# se status nao for 4, log de erro
# users será o executor master desse checklist. pode se sobrepor a area de responsabilidade ??
# formulario com os parametros dinamico do jira, armazenados no Params do exec.
# 
# TODO - verificar se é somente checklist ou abrir ticket tb

		tickets = MontaTreeTickets(@execchecklist.checklist, :master)
		ticketpai = nil
		tickets.each do |t|
			ticket = Jira.new
			if t[:tipo] == :master
				ticket.create_ticket({:titulo => t[:descricao], 
			       	 				  :itens => t[:comentarios].join("\r\n"), 
			      					  :responsavel =>  @execchecklist.users }) #"magno"}) #
			    # TODO colocar trap de erro aqui..  					  	
				ticketpai = ticket.ticket.key
			elsif t[:tipo] == :superpai
				ticket.create_sub_tarefa({:titulo => t[:descricao], 
			       	 				 	  :itens => t[:comentarios].join("\r\n"), 
			      					 	  :responsavel => @execchecklist.users, #"magno", #
			      					 	  :ticket_pai => ticketpai })	
			end
		end
		
		@execchecklist.tickets = ticketpai
		@execchecklist.status_checklist_id = 1
		@execchecklist.save		
	 
	 	# TODO - se ja existir um jira no CI, coloca no final e adiciona no comentario do jira pai
	 	#        se nao existir umj jira, coloca no inicio.
	    # @execchecklist.cis.split(",") do |c|
	    # 	ci = Ci.find_gen(c)
	    	# ci.jira << "#{execchecklist.alias}|#{ticketpai},#{ci.jira}" unless ci.nil?
	    # end
	    # atualizar data de mudanca do CI.	

		{:ticket => ticketpai}


	end

	def print
		p @execchecklist
		p @itens_novos_ticket
		p @itens_comentarios
	end
end