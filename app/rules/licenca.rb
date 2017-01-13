bre = Bre.instance

Rails.logger.info "[INFO] Registrando BRE..."

bre.adicionaRegra "Manutencao Licencas" do
	quando :mudar_status, :ci, "Licenca" do |licenca|
   		# notificar "licenciamento", "Mudanca de status de licenca", licenca
   		# RegistrarLog "Mudanca de status de licenca", licenca
   	end
end