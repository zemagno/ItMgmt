class	AlertaFromCi

# TODO: criar Services Alerta
# 
# Principio: CI nao tem que saber Incidente. Incidente nao tem que saber de CI, enviar email
# Service: sabe o que abrir no alerta, o que enviar email, o que marcar no CI de mudanca/impacto
# 
# 
# marcar data de incidente no CI (tem que colocar mais um campo no CI, alem do Mudanca)
# sidekiq: impactados
# abrir alerta com campos preenchidos (CI, data, impactado)
#    Como abrir sem redirect ? pode criar um e ir para edit desse alerta.
# colocar logica de abrir Alerta aqui e nao no CI.
# inserir no SLA
# notificar impactados
# 

end
