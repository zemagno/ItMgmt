class ServiceAcertaOwner
	def go
		Ci.find_each do |ci|
			 if ci.Owner =~ /^[a-zA-z.]+$/ and ci.notificacao =~ /^[a-zA-z.]+$/
			 	f = Funcionario.find_by_Login(ci.Owner)
			 	if ! f.nil? and ! f.DataDemissao.nil? 
			 		novoGestor = Gestores.find_by_LoginFunc(ci.notificacao)
			 		if ! novoGestor.nil?
			 			ci.Owner = novoGestor.LoginGestor
			 			ci.save!
			 			Event.register("Acerta Ci","Owner","detalhe","Novo gestor de #{ci.chave}:#{ci.notificacao} ==> #{novoGestor.LoginGestor}")
			 		end
			 	end
			 end
			 # acertar licenca liberando de notificacao demitido
			 # estacao --> prefiro nao liberar por codigo e sim por processo
			 # licenca --> liberar por processo, enviando comando para estrutura do AD / sccm
		end
	end
end


# ActiveRecord::Base.logger.level = 1