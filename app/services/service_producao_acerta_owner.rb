class ServiceProducaoAcertaOwner

  def go

    filtroCi = Parametro.get(:tipo => "PRODUCAO",:subtipo => "AcertaOwner").split(",").map(&:to_i)

    status = "Ok"
    detalhe = ""
    totalUpdated = 0


    Ci.find_all_by_tipoci_id(filtroCi).each do |ci|
      # Ci.find_all_by_id([14457]).each do |ci|
      if ci.Owner =~ /^[a-zA-z.]+$/ and ci.notificacao =~ /^[a-zA-z.]+$/
        gestor = Funcionario.find_by_Login(ci.Owner)
        usuario = Funcionario.find_by_Login(ci.notificacao)
        # if ! gestor.nil? and gestor.demitido? and ! usuario.nil? and ! usuario.demitido?

        if ! gestor.nil? and ! usuario.nil? and ! usuario.demitido?
          novoGestor = usuario.gestor
          puts "Novo Gestor --> #{novoGestor}"
          if ! novoGestor.nil? and gestor.Login != novoGestor
            ci.Owner = novoGestor
            begin
              ci.save!
            rescue
            end
            Event.register("Acerta Ci","Owner","detalhe","Novo gestor de #{ci.chave}:#{ci.notificacao} ==> #{novoGestor}")
            totalUpdated = totalUpdated + 1

          end
        end
      end
      # acertar licenca liberando de notificacao demitido
      # estacao --> prefiro nao liberar por codigo e sim por processo
      # licenca --> liberar por processo, enviando comando para estrutura do AD / sccm
    end
    detalhe << "Acerta Gestor - total de #{totalUpdated} gestores atualizados"
    [status,detalhe]
  end
end


# ActiveRecord::Base.logger.level = 1
