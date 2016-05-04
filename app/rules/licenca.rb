bre = Bre.instance

puts "Registrando BRE..."

bre.adicionaRegra "Manutencao Licencas" do
	quando :mudar_status, :ci, "Licencas" do |licenca|
   		notificar "licenciamentoBRQ", licenca
   	end
end