template = 55
_body  = "teste1;teste2"
_subject = "teste de envio de email"
_cc = "zemagno@gmail.com"
_to = "magno@4mstech.com,zemagno@gmail.com"
_from = "magno@4mstech.com"

CiMailer.enviar(template,_body,_subject,_to,_cc,_from).deliver