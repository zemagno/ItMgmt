
require "queueable"
class ServiceChecklist

	# TODO - crise de identidade... servicechecklist será instanciado ??
	# recebe um Model Checklist ou um InitChecklist 

	include Queueable
	def initialize(checklist)
		@checklist = checklist
		@itens_novos_ticket = nil
		@itens_comentarios = nil
	end 

	def ChecklistHerdados
		# @checklist
		# armazenar no Redis
		# TODO - armazenar no Cache...
		# 
		# Devolve: lista com toos os itens de todos os checklist pais
		#          que irao virar tickets (jira) e itens que serão somente 
		#          comentario a serem ticados no ItMgmt
		# 
		@itens_novos_ticket = []
		@itens_comentarios = []

		checklist_visitado = Hash.new

		enqueue(@checklist)

		while not queue_empty?
            checklist = dequeue
	        if not checklist_visitado[checklist.id] then 
            	checklist_visitado[checklist.id] = true
                checklist.itens_checklists.each do |item|
                	case item.TipoAberturaTicket
                	when "Novo Ticket"
                        @itens_novos_ticket << [item.descricao, item.users, item.cis, item.TipoAberturaTicket, item.tipo_checklist_id]
                	when "Comentario"

                        @itens_comentarios << [item.descricao, item.users, item.cis, item.TipoAberturaTicket, item.tipo_checklist_id]
                	end
                end

            end
            # coloco os pais na fila para serem navegados
            checklist.pais.map { |x| enqueue(x)}
            
		end	
		# retorno lista para ticket e lista para comentarios           	
		[@itens_novos_ticket, @itens_comentarios]
	end

	def IniciarChecklist 
		# inicia um checklist, criando um exec_checklist e iniciando uma tarefa no sidekiq
		# com isso, eu devolvo o controle logo para a pagina e depois assincronamete, eu vou criando os itens no db e no jira
	    
	    # TODO falta tipoci_id
	    # criar itens
	    # enfilerar no sidekiq para abrir os tickects

	    exec_checklist = ExecChecklist.new
	    exec_checklist.descricao = @checklist.descricao
	    exec_checklist.users = @checklist.users
	    exec_checklist.cis = @checklist.cis
	    exec_checklist.inicioexec = @checklist.inicioexec
	    exec_checklist.fimexec = @checklist.fimexec
	    exec_checklist.status_checklist_id = 4
	    exec_checklist.save
	    IniciarChecklist.perform_async(exec_checklist.id)
	    
	    exec_checklist.id
    	
	end

	def FinalizarCriacaoChecklist
		# comentarios --> Comentarios do Jira pai e itens_checklists
		# ticket --> subjira do jira pai
		# itens_novos_ticket, itens_comentarios = ChecklistHerdados

		# Montar ticket pai
		# Adicionar todos os comentarios no ticket pai
		# Criar ticket pai
		# criar itens_checklist com comentarios

		# para cada iten novo ticket
		# 	montar ticket debaixo do ticket pai
		# 	criar ticket
		# 	criar itens_checklist
		# fim 
		



	end

	def dummy
		ecl = ExecChecklist.find(5)
		scl = ServiceChecklist.new(ecl.checklist)
		ch = scl.ChecklistHerdados
		
	end



	def print
		p @checklist
		p @itens_novos_ticket
		p @itens_comentarios
	end
end
