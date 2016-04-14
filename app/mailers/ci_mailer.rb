class CiMailer < ActionMailer::Base
  append_view_path SqlTemplate::Resolver.new

  def enviar(template,_body,_subject,_to,_cc,_from)
    @obj = _body
    mail(to: _to, subject: _subject, template_name: template, cc: _cc, from: _from)

  end

  def enviar_anexo(template,_body,_subject,_to,_cc,_from,_attachment)
    @obj = _body
    attachments[_attachment.split("/").last] = File.read(_attachment)
    mail(to: _to, subject: _subject, template_name: template, cc: _cc, from: _from)

  end



end
