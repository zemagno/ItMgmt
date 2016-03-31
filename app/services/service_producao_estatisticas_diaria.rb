class ServiceProducaoEstatisticasDiaria
  def go

    stats = Sidekiq::Stats.new
    rs = Sidekiq::RetrySet.new
    texto = "Processed: #{stats.processed} \n Failed: #{stats.failed} \n Queues: #{stats.queues.to_s} \n: Retries: #{rs.size} "
    
    detalhe << "Acerta Licencas - total de #{totalUpdated} licencas atualizadas"

    params = Hash[JSON.parse Parametro.get(:tipo => "Alerta", :subtipo => "GESTAO")]
    params[:to] = ListaEmail.acerta(params[:to],"@brq.com")
    params[:to] = ListaEmail.blacklist(params[:to])
    params[:from] = ListaEmail.acerta(params[:from],"@brq.com")
    params[:cc] = ListaEmail.acerta(params[:cc],"@brq.com")
    params[:cc] = ListaEmail.blacklist(params[:cc])
        
    CiMailer.enviar(template.template,params[:body],params[:subject],params[:to],params[:cc],params[:from]).deliver
         # TODO se isso acima funcionar, alterar as duas linhas abaixo e o from acima
         job.status = "Email enviado para #{params[:to]}. #{job.templates_email.template} em #{Time.now}" 
         Event.register("email","mailing","detalhe","Enviado to:#{params[:to]} - subject:#{params[:subject]} - from: #{params[:from]}")  


    [status,detalhe]
  end
end
