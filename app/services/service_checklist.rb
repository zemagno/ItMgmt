
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
		
	    exec_checklist = ExecChecklist.new
	    exec_checklist.descricao = @checklist.descricao
	    exec_checklist.users = @checklist.users
	    exec_checklist.cis = @cis
	    exec_checklist.inicioexec = Date.today
	    exec_checklist.fimexec = Date.today
	    exec_checklist.save
	    exec_checklist
			
	end

	def print
		puts @checklist
		puts @itens_novos_ticket
		puts @itens_comentarios
	end
end
