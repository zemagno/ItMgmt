class EnviaEmailWorker
  include Sidekiq::Worker
  sidekiq_options queue: "Gestao" , :retry => 4, :backtrace => true
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
    
  
    # incluir tb no combobox templates_emails/_form.html.erb
    case template.tipo
    when "CI"  
         # TODO simplificar isso aqui..
         ci = Ci.includes(:atributo => :dicdado).find(params[:id])
         destinatario = ListaEmail.acerta(Ci.Owner,"@brq.com")
         from = Parametro.find_by_tipo_and_subtipo("EMAIL_CI","FROM").valor
         cc = Parametro.find_by_tipo_and_subtipo("EMAIL_CI","CC").valor
         CiMailer.enviar(template.template,ci,"NOC - #{template.nome} - #{ci.chave}",destinatario,cc,from).deliver
         job.status = "Email enviado para #{destinatario}. #{job.templates_email.template}: [#{ci.chave}] em #{Time.now}"  
         Event.register("email","CI","detalhe","CI - email direto - NOC - #{template.nome} - #{ci.chave}")  
    when "ALERTAS"
         task = Task.find(params[:alerta])
         destinatario = "rbleckmann@brq.com,dacarvalho@brq.com,aroldojunior@brq.com,magno@brq.com"
         from = Parametro.find_by_tipo_and_subtipo("EMAIL_ALERTA","FROM").valor
         cc = Parametro.find_by_tipo_and_subtipo("EMAIL_ALERTA","CC").valor
         CiMailer.enviar(template.template,task,"NOC - #{template.nome} - #{task.id}",destinatario,cc,from).deliver
         job.status = "Email enviado para #{destinatario}. #{job.templates_email.template}: [#{task.id}] em #{Time.now}"  
    when "MAILING"
         mailing = Mailing.find(params[:id])
         from = params[:from] #|| Parametro.find_by_tipo_and_subtipo("EMAIL_ALERTA","FROM").valor
         #CiMailer.enviar(template.template,mailing,mailing.subject,mailing.to,mailing.mailing.cc,mailing.from).deliver
         CiMailer.enviar(template.template,mailing,params[:subject],params[:to],params[:cc],from).deliver
         # TODO se isso acima funcionar, alterar as duas linhas abaixo e o from acima
         job.status = "Email enviado para #{params[:to]}. #{job.templates_email.template}: [#{mailing.id}] em #{Time.now}" 
         Event.register("email","mailing - #{mailing.tag}","detalhe","Enviado to:#{params[:to]} - subject:#{params[:subject]} - from: #{from}")  
    end
    job.save!
  end
end
