
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
    	queue = []
    	checklist_visitado = Hash.new
    	
    	ticket = {tipo: tipo_ticket, descricao: cl.descricao, users: cl.users, comentarios: [] }
    	
    	queue.push(cl)
    	cl.pais.map { |x| queue.push(x)}
    	puts "fila"
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
	       			puts "comment #{comment}"
	       		end
	       	end
	       	checklist.pais.map { |x| queue.push(x)}
        end
        puts ">>>> #{comentarios}"

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
	    exec_checklist.users = @execchecklist.users
	    exec_checklist.cis = @execchecklist.cis
	    exec_checklist.inicioexec = @execchecklist.inicioexec
	    exec_checklist.fimexec = @execchecklist.fimexec
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

		tickets = MontaTreeTickets(@execchecklist.checklist, :master)
		ticketpai = nil
		tickets.each do |t|
			ticket = Jira.new
			if t[:tipo] == :master
				ticket.create_ticket({:titulo => t[:descricao], 
			       	 				  :itens => t[:comentarios].join("\r\n"), 
			      					  :responsavel => "magno" })	
				ticketpai = ticket.ticket.key
			elsif t[:tipo] == :superpai
				ticket.create_sub_tarefa({:titulo => t[:descricao], 
			       	 				 	  :itens => t[:comentarios].join("\r\n"), 
			      					 	  :responsavel => "magno",
			      					 	  :ticket_pai => ticketpai })	
			end
		end
		
		@execchecklist.tickets = ticketpai
		@execchecklist.status_checklist_id = 1
		@execchecklist.save		
		{:ticket => ticketpai}
	end

	def print
		p @execchecklist
		p @itens_novos_ticket
		p @itens_comentarios
	end
end