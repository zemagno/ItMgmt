class LicencasController < ApplicationController

  def porGestor
    usr = params[:id]
    @gestor=LicenciamentoGestor.new(usr)
    @licencas=@gestor.niceSoftwareEmUso
    @licencas[1][0].each{|s| s.gsub!(/Microsoft |Embarcadero |Sybase |IBM |MicroFocus /,'')}
    puts @licencas
  end

end


