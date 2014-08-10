class EnviaEmailWorker
  include Sidekiq::Worker
  sidekiq_options queue: "Gestao" , :retry => 2, :backtrace => true
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
    
    

    # incluir tb no combobox templates_emails/_form.html.erb
    case template.tipo
    when "CI"  
         # TODO simplificar isso aqui..
         ci = Ci.includes(:atributo => :dicdado).find(params[:id])
         destinatario = "rbleckmann@brq.com,dacarvalho@brq.com,aroldojunior@brq.com,magno@brq.com"
         from = Parametro.find_by_tipo_and_subtipo("EMAIL_CI","FROM").valor
         CiMailer.enviar(template.template,ci,"NOC - #{template.nome} - #{ci.chave}",destinatario,"",from).deliver
         job.status = "Email enviado para #{destinatario}. #{job.templates_email.template}: [#{ci.chave}] em #{Time.now}"  
         Event.register("email","CI","detalhe","CI - email direto - NOC - #{template.nome} - #{ci.chave}")  
    when "ALERTAS"
         task = Task.find(params[:alerta])
         destinatario = "rbleckmann@brq.com,dacarvalho@brq.com,aroldojunior@brq.com,magno@brq.com"
         from = Parametro.find_by_tipo_and_subtipo("EMAIL_ALERTA","FROM").valor
         CiMailer.enviar(template.template,task,"NOC - #{template.nome} - #{task.id}",destinatario,"",from).deliver
         job.status = "Email enviado para #{destinatario}. #{job.templates_email.template}: [#{task.id}] em #{Time.now}"  
    when "MAILING"
         mailing = Mailing.find(params[:id])
         from = params[:from] #|| Parametro.find_by_tipo_and_subtipo("EMAIL_ALERTA","FROM").valor
         CiMailer.enviar(template.template,mailing,params[:subject],params[:to],params[:cc],from).deliver
         job.status = "Email enviado para #{params[:to]}. #{job.templates_email.template}: [#{mailing.id}] em #{Time.now}" 
         Event.register("email","mailing - #{mailing.tag}","detalhe","Enviado to:#{params[:to]} - subject:#{params[:subject]} - from: #{from}")  
    end
    job.save!
  end
end
