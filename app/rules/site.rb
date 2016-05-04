bre = Bre.instance

puts "Registrando BRE..."

bre.adicionaRegra "Criacao de Servidor" do
  quando :criar, :ci, :site do |site|
    #notificar :equipeFacilities, "Criacao de site", site
    notificar :equipeFinanceiro, "Criacao de site", site
  end

end
