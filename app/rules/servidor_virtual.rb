bre = Bre.instance

puts "Registrando BRE..."

bre.adicionaRegra "Criacao de Servidor" do
	quando :criar, :ci, "Servidor Virtual" do |servidor|
		puts "BRE: vou rodar regra criac ci servidor virtual"
   		notificar "noc",  "Incluir Servidor na Monitoracao", servidor
   		notificar "dc",   "Criacao backup para Servidor"   , servidor
   		abrirJira :jira_tipo_tal, "BRE:Criacao de Backup para Servidor",   servidor
    end
    
end

bre.adicionaRegra "Manutencao Servidor" do
	quando :mudar_status, :ci, "Servidor Virtual" do |servidor|
   		notificar "DC", "Servidor Virtual: Mudanca de Status", servidor
   	end
end