bre = Bre.instance

puts "Registrando BRE..."

bre.adicionaRegra "Manutencao Licencas" do
	quando :mudar_status, :ci, "Licenca" do |licenca|
   		notificar "licenciamentoBRQ", "Mudanca de status de licenca", licenca
   	end
end