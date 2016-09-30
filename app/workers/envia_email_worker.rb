class EnviaEmailWorker
  include Sidekiq::Worker
  sidekiq_options queue: "Mailing" , :retry => 4, :backtrace => true
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


    template = job.templates_email # esse template é um id. Pego o template que é path ci_mailes/<<template>> e que esta no SQL.

    params = YAML.load(job.parametro)


    # incluir tb no combobox templates_emails/_form.html.erb
    case template.tipo
    when "CI"
      # TODO simplificar isso aqui..
      ci = Ci.includes(:atributo => :dicdado).find(params[:id])
      destinatario = ListaEmail.acerta({listaEmails:ci.Owner+","+ci.notificacao,sufixo:EstacaoExFuncSP})

      _params = Parametro.get(:tipo => "EMAIL_CI", :subtipo => template.id)
      if _params.blank? # se nao achar from/cc do template, usara o padrao

        from = Parametro.get(:tipo => "EMAIL_CI", :subtipo => "FROM")
        cc = Parametro.get(:tipo => "EMAIL_CI", :subtipo => "CC")
      else
        params = Hash[JSON.parse _params]
        # params = params.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
        from = params["from"]
        cc = params["cc"]
      end

      from = Parametro.get(:tipo => "EMAIL_CI", :subtipo => "FROM") if from.blank?

      CiMailer.enviar(template.template,ci,"NOC - #{template.nome} - #{ci.chave}",destinatario,cc,from).deliver
      job.status = "Email enviado para #{destinatario}. #{job.templates_email.template}: [#{ci.chave}] em #{Time.now}"
      Event.register("email","CI","detalhe","CI - email direto - NOC - #{template.nome} - #{ci.chave}")

    when "ALERTAS"
      task = Task.find(params[:alerta])
      destinatario = "zemagno@gmail.com"
      from = Parametro.get(:tipo => "EMAIL_ALERTA", :subtipo => "FROM")
      cc = Parametro.get(:tipo => "EMAIL_ALERTA", :subtipo => "CC")
      CiMailer.enviar(template.template,task,"NOC - #{template.nome} - #{task.id}",destinatario,cc,from).deliver
      job.status = "Email enviado para #{destinatario}. #{job.templates_email.template}: [#{task.id}] em #{Time.now}"

    when "MAILING"
      params[:to] = ListaEmail.acerta({listaEmails:params[:to],sufixo:CONFIG["mail"]["domain"], blacklist:true})
      params[:from] = ListaEmail.acerta({listaEmails:params[:from],sufixo:CONFIG["mail"]["domain"], blacklist:false})
      params[:cc] = ListaEmail.acerta({listaEmails:params[:cc],sufixo:CONFIG["mail"]["domain"], blacklist:true})

      CiMailer.enviar(template.template,params[:body],params[:subject],params[:to],params[:cc],params[:from]).deliver
      # TODO se isso acima funcionar, alterar as duas linhas abaixo e o from acima
      job.status = "Email enviado para #{params[:to]}. #{job.templates_email.template} em #{Time.now}"
      Event.register("email","mailing","detalhe","Enviado to:#{params[:to]} - subject:#{params[:subject]} - from: #{params[:from]}")

    when "GESTAO USUARIO"
      # TODO simplificar isso aqui..
      login = params[:id]
      usr = GestaoUsuario.new(login: login )

      destinatario = ListaEmail.acerta({listaEmails:login,sufixo:CONFIG["mail"]["domain"]})
      subject = template.subject.blank? ? "Service Desk - #{template.nome}" : template.subject
      from = template.from.blank? ? "servicedesk#{CONFIG["mail"]["domain"]}" : ListaEmail.acerta({listaEmails:template.from,sufixo:CONFIG["mail"]["domain"], blacklist:true})
      cc = template.cc.blank? ? "" : ListaEmail.acerta({listaEmails:template.cc,sufixo:CONFIG["mail"]["domain"], blacklist:true})

      CiMailer.enviar(template.template,usr,subject,destinatario,cc,from).deliver
      job.status = "Email enviado para #{destinatario}. #{job.templates_email.template}: [#{usr.login}] em #{Time.now}"
      Event.register("email","Gestao Usuario","detalhe","Gestao Usuario - email direto - #{template.nome} - #{usr.login}")

    when "GESTAO LICENCA"
      loginGestor = params[:gestor]
      gestor=GestaoLicenciamento.new(loginGestor)
      if ! gestor.nil?
        licencas=gestor.niceSoftwareEmUsoEquipeGestor(true,true)
        licencas[1][0].each{|s| s.gsub!(/Microsoft |Embarcadero |Sybase |IBM |MicroFocus /,'')}
        destinatario = ListaEmail.acerta({listaEmails:loginGestor,sufixo:CONFIG["mail"]["domain"]})
        # destinatario = ListaEmail.acerta(loginGestor,CONFIG["mail"]["domain"])
        # destinatario = "aroldojunior@brq.com,rbleckmann@brq.com,zemagno@gmail.com"
        from = "licenciamentobrq@brq.com"
        # TODO --> colocar esse from nos parametros
        cc =  ""
        CiMailer.enviar_anexo(template.template,licencas,"Extrato Mensal: Uso de Software",destinatario,cc,from,licencas[0][1]).deliver
        job.status = "Email enviado para #{destinatario}. Extrato Mensal de Uso de Software em #{Time.now}"
        Event.register("email","Gestao Licenca","detalhe","Gestao Licenca - email direto - #{template.nome} - #{gestor}")
      end

    end
    job.save!
  end
end
