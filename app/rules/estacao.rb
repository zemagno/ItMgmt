bre = Bre.instance

Rails.logger.info "[INFO] Registrando BRE - Estação..."

bre.adicionaRegra "Estacao" do
	quando :mudar_status, :ci, "Estacao" do |estacao|
   		# notificar "licenciamento", "Mudanca de status de licenca", licenca
   		if estacao.statusci_id == 1 
   			Rails.logger.debug "[DEBUG]BRE:Entrando na regra: Estacao - mudar_status - statusci=1"
   			aplicarParametros "CobrarEstacao",estacao
   		end
   		if estacao.oldStatusci_id == 1 
   			Rails.logger.debug "[DEBUG]BRE:Entrando na regra: Estacao - mudar_status - old_statusci=1"
   			aplicarParametros "EstocarEstacao",estacao
   		end
   	end
end

# 13897