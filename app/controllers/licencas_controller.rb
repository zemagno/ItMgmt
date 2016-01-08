class LicencasController < ApplicationController
  # load_and_authorize_resource


  def porGestor

    puts "_____________________________________________________________________________"
    puts params
    puts "_____________________________________________________________________________"

    authorize! :read, :licencas, :message => "Voce nao tem permissao para visualizar isso."
    usr = params[:id]
    @gestor=GestaoLicenciamento.new(usr)
    @licencas=@gestor.niceSoftwareEmUsoEquipeGestor(false)
    #@licencas[1][0].each{|s| s.gsub!(/Microsoft |Embarcadero |Sybase |IBM |MicroFocus /,'')}
   
      @lic1 = @licencas[1].transpose
      i = 2
        begin
         if @lic1[i].last.to_i == 0
            puts "vou apagar #{i} - #{@lic1.count-2}"
            @lic1.delete_at(i)
         else 
            i = i + 1
         end
        end while i < @lic1.count-2
        @licencas[1] = @lic1.transpose
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


