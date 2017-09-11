class JobAsyncWorker
	include Sidekiq::Worker
	sidekiq_options queue: "Producao" , :retry => 4, :backtrace => true
	def perform(job_id)
    	job = JobAsync.find(job_id) 
    	job.executed!
    	job.save!
    	puts job
    end
    def lixo
		campos = ci.changed
		attrs = {}
		campos.each { |campo| attrs[campo] = [ci.send(campo),ci.send("#{campo}_was")] }

		JobAsync.add("Ci",ci.id,attrs)
	end
end





# enum status: [ :template, :emPreparo, :iniciado, :finalizado, :cancelado ]

#   def teste
#   	c = Checklist.new
#     c.nome ="Desativar Servidor"
#     c.iniciado!
#     c.save!
#     c.iniciado?
#     Checklist.iniciado
  	
#   end

#   def self.templates
#     where(status: Checklist.statuses["template"])
#   end


