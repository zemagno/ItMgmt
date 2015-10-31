class LicencasController < ApplicationController
  # load_and_authorize_resource


  def porGestor

    puts "_____________________________________________________________________________"
    puts params
    puts "_____________________________________________________________________________"

    authorize! :read, :licencas, :message => "Voce nao tem permissao para visuzalizar isso."
    usr = params[:id]
    @gestor=GestaoLicenciamento.new(usr)
    @licencas=@gestor.niceSoftwareEmUsoEquipeGestor
    @licencas[1][0].each{|s| s.gsub!(/Microsoft |Embarcadero |Sybase |IBM |MicroFocus /,'')}
  end

  def porUsuario
    authorize! :read, :licencas, :message => "Voce nao tem permissao para visuzalizar isso."
    usr = params[:id]
    @usuario = GestaoUsuario.new(:login => usr)
    usuario=GestaoLicenciamento.new(usr)
    @licencas=usuario.softwareEmUsoPorEstacao
  end


  def estacoesEquipeGestor
    authorize! :read, :licencas, :message => "Voce nao tem permissao para visuzalizar isso."
    usr = params[:id]
    @gestor=GestaoLicenciamento.new(usr)
    @usuario = GestaoUsuario.new(:login => usr)
    @estacoesEquipe = @gestor.estacoesEmUsoEquipeGestor
  end

end


