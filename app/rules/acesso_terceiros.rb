bre = Bre.instance

Rails.logger.info "[INFO] Registrando BRE..."

bre.adicionaRegra "Criacao Acesso Terceiro" do
	quando :criar, :ci, "Acesso Terceiros" do |terceiro|
   		criarEmailExterno terceiro
   		notificar "noc",  "Criacao de Terceiro", terceiro
   		adicionaGrupo "terceiros", terceiro   		
    end
    
end

bre.adicionaRegra "Retirar acesso Terceiro" do
	quando :mudar_status, :ci, "Acesso Terceiros" do |terceiro|
   		if terceiro.oldStatusci_id == 1 
			puts "BRE.adicionaregra -> CI mudou de status"
			notificar "microinformatica", "Remover Estacao e softwares", terceiro
		end
   	end
end