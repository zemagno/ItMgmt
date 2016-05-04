bre = Bre.instance

puts "Registrando BRE..."

bre.adicionaRegra "Criacao Acesso Terceiro" do
	quando :criar, :ci, "Acesso Terceiros" do |terceiro|
   		criarEmailExterno terceiro
   		notificar "noc",  "Criacao de Terceiro", terceiro
   		adicionaGrupo "terceiros", terceiro   		
    end
    
end