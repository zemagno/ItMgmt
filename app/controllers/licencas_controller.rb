class LicencasController < ApplicationController

  def porGestor
    usr = params[:id]
    @gestor=GestaoLicenciamento.new(usr)
    @licencas=@gestor.niceSoftwareEmUsoEquipeGestor
    @licencas[1][0].each{|s| s.gsub!(/Microsoft |Embarcadero |Sybase |IBM |MicroFocus /,'')}
    puts @licencas
  end

end


