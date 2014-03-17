class CiMailer < ActionMailer::Base
    #AbstractController
    append_view_path SqlTemplate::Resolver.new
    default from: "zemagno@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ci_mailer.revalidar_servidor.subject
  #
  # posso substituir por um no_method, buscando a classe do objeto, criando dinamicamente
  # ou colocando o OBJ dentro do helper de mailer e nao CI, TASK, etc.

  # cada metodo abaixo tem que ter um arquivo com nome equivalente debaixo de views/ci_mailer

  def revalidar_servidor(obj,subject,destinatario)
    @ci = obj
    mail to: destinatario
  end

  def problema_servidor(obj,subject,destinatario)
    @ci = obj
    mail to: destinatario
  end

  def alerta_incidente(obj,subject,destinatario)
    @task = obj
    mail to: destinatario
  end

end
