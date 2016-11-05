bre = Bre.instance

Rails.logger.info "[INFO] Registrando BRE..."

bre.adicionaRegra "Criacao de Servidor" do
  quando :criar, :ci, :site do |site|
    #notificar :equipeFacilities, "Criacao de site", site
    notificar :equipeFinanceiro, "Criacao de site", site
  end

end
