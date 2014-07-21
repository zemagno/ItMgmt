class CiMailer < ActionMailer::Base
    append_view_path SqlTemplate::Resolver.new

    def enviar(template,obj,_subject,_to,_cc,_from)
	    @obj = obj
	    mail(to: _to, subject: _subject, template_name: template, cc: _cc, from: _from)

    end


end
