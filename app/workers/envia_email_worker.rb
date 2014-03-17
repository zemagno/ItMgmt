class EnviaEmailWorker
  include Sidekiq::Worker
  sidekiq_options queue: "Gestao"
  #sidekiq_options retry: false
  

  # template = [tipo (de model), template (de email), nome]
  # tipo = CI, INCIDENTE
  # templace = revalidar_servidor, alerta_incidente
  # Nome de fantasia = Revalidar Servidor, Alerta de Incidente
   
  # exemplo: 
  #    job = [template_id,hash com parametros, status] == [14, {:ci=>"361", :to=>"zecarlosmagno@gmail.com"}, status]
  #    template[14] = [CI, revalidar_servidor, ..., ...]
  #  
  #    Resultado: usar o template revalidar_servidor, com o CI(361)
  def perform(job_id)
    job = JobEnviarEmail.find(job_id) # busco o job no BD

    template = job.templates_email 
    
    params = YAML.load(job.parametro) 
    destinatario = params[:to]

    case template.tipo
    when "CI"  
      
         ci = Ci.includes(:atributo => :dicdado).find(params[:id])
         destinatario = "zecarlosmagno@gmail.com"
         CiMailer.send(template.template,ci,"#{template.nome} - #{ci.chave}",destinatario).deliver
         job.status = "Email enviado para #{destinatario}. #{job.templates_email.template}: [#{ci.chave}] em #{Time.now}"  
    when "INCIDENTE"
         task = Task.find(params[:alerta])
         destinatario = "zecarlosmagno@gmail.com"
         CiMailer.send(template.template,task,"#{template.nome} - #{task.id}",destinatario).deliver
         job.status = "Email enviado para #{destinatario}. #{job.templates_email.template}: [#{task.id}] em #{Time.now}"  
    end
    job.save!
  end
end
