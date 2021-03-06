class ServiceProducaoEstatisticasDiaria
  def go
    detalhe = ""
    stats = Sidekiq::Stats.new
    rs = Sidekiq::RetrySet.new
    detalhe = "Processed: #{stats.processed} \n Failed: #{stats.failed} \n Queues: #{stats.queues.to_s} \n: Retries: #{rs.size} "
    
    params = Hash[JSON.parse Parametro.get(:tipo => "Alerta", :subtipo => "GESTAO")]
    params[:to] = ListaEmail.acerta({listaEmails:params[:to],sufixo:CONFIG["mail"]["domain"],blacklist:true})
    params[:from] = ListaEmail.acerta({listaEmails:params[:from],sufixo:CONFIG["mail"]["domain"],blacklist:false})
    params[:cc] = ListaEmail.acerta({listaEmails:params[:cc],sufixo:CONFIG["mail"]["domain"],blacklist:true})
    # params[:to] = ListaEmail.blacklist({params[:to]})
    # params[:cc] = ListaEmail.blacklist({params[:cc]})
        
    CiMailer.enviar(template.template,params[:body],params[:subject],params[:to],params[:cc],params[:from]).deliver
         # TODO se isso acima funcionar, alterar as duas linhas abaixo e o from acima
         job.status = "Email enviado para #{params[:to]}. #{job.templates_email.template} em #{Time.now}" 
         Event.register("email","mailing","detalhe","Enviado to:#{params[:to]} - subject:#{params[:subject]} - from: #{params[:from]}")  


    [status,detalhe]
  end
end
