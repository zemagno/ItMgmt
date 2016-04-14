class JobEnviarEmail < ActiveRecord::Base
  belongs_to :templates_email
  attr_accessible :parametro, :templates_email_id

  	def self.criar(_template, _parametro)
      job = JobEnviarEmail.new
      job.templates_email_id = _template
      job.parametro = _parametro
      job.status = "Criado"
      job.save!
      puts "JobEnviarEmail criado !!"
      EnviaEmailWorker.perform_async(job.id)
      
      job
    end

end
