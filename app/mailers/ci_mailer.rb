class CiMailer < ActionMailer::Base
  append_view_path SqlTemplate::Resolver.new

  def enviar(template,_body,_subject,_to,_cc,_from)
    @obj = _body
    mail(to: _to, subject: _subject, template_name: template, cc: _cc, from: _from)

  end

  def enviar_anexo(template,_body,_subject,_to,_cc,_from,_attachment)
    @obj = _body
    _from = CONFIG["SMTP"]["default_from"] if _from.blank?
    #TODO colocar teste de erro com _to, templates, from
    attachments[_attachment.split("/").last] = File.read(_attachment)
    mail(to: _to, subject: _subject, template_name: template, cc: _cc, from: _from)

  end



end
