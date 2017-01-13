bre = Bre.instance

Rails.logger.info "[INFO] Registrando BRE de estação..."

bre.adicionaRegra "Estacao" do
	quando :mudar_status, :ci, "Estacao" do |estacao|
   		# notificar "licenciamento", "Mudanca de status de licenca", licenca
   		if estacao.statusci_id == 1 
   			aplicarParametros "CobrarEstacao",estacao
   		end
   	end
end

# 13897