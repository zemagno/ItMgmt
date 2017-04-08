bre = Bre.instance

Rails.logger.info "[INFO] Registrando BRE - Servidor Virtual..."

bre.adicionaRegra "Criacao de Servidor" do
	quando :criar, :ci, "Servidor Virtual" do |servidor|
		# notificar "noc",  "Incluir Servidor na Monitoracao", servidor
		# puts "BRE: vou rodar regra criac ci servidor virtual"
		# notificar "dc",   "Criacao backup para Servidor"   , servidor
		# abrirJira :jira_tipo_tal, "BRE:Criacao de Backup para Servidor",   servidor
    end
    
end

bre.adicionaRegra "Manutencao Servidor" do
	quando :mudar_status, :ci, "Servidor Virtual" do |servidor|
   		# notificar "licenciamento", "Mudanca de status de licenca", licenca
   		if servidor.statusci_id == 1 
   			Rails.logger.debug "[DEBUG]BRE:Entrando na regra: Manutencao Servidor - mudar_status - Status=1"
   			aplicarParametros "CobrarServidorVirtual",servidor
   			notificar "financeiro","Criacao Servidor Virtual",servidor
   		end
   		if servidor.oldStatusci_id == 1 
   			Rails.logger.debug "[DEBUG]BRE:Entrando na regra: Manutencao Servidor - mudar_status - Old=1"
			# puts "BRE.adicionaregra -> CI mudou de status"
			# notificar "DC", "Servidor Virtual: Mudanca de Status", servidor
		end
   	end
end