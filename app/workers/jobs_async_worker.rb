class JobAsyncWorker
	def perform(job_id)
    	job = jobAsync.find(job_id) 


    end
end

def lixo
campos = ci.changed
attrs = {}
campos.each { |campo| attrs[campo] = [ci.send(campo),ci.send("#{campo}_was")] }

JobAsync.create! do |job|
	job.tipo = "Ci"
	job.record_id = ci.id
	job.
	job.params = attrs
	job.status = JobAsync.pending
end

JobAsyncWorker.perform_async(job.id)


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


