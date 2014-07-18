class CiMailer < ActionMailer::Base
    #AbstractController
    append_view_path SqlTemplate::Resolver.new
    default from: "zemagno@gmail.com"

    def enviar(template,obj,subject,destinatario,copiados)
	    @obj = obj
	    mail(to: destinatario, subject: subject, template_name: template, cc: copiados)

    end


end
