class CiMailer < ActionMailer::Base
    append_view_path SqlTemplate::Resolver.new

    def enviar(template,_body,_subject,_to,_cc,_from)
	    @obj = _body
	    mail(to: _to, subject: _subject, template_name: template, cc: _cc, from: _from)

    end


end
