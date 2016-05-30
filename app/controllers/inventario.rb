class InventarioController < ApplicationController
  # load_and_authorize_resource

  def getLicencasPorGestor(usr)
    
   
    
  end

  def porHostname

    authorize! :read, :licencas, :message => "Voce nao tem permissao para visualizar isso."
    usr = params[:id]

    softwares = ""

  end

end
