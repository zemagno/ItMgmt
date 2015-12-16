class ServiceCargaRmAfastados

  def go
    status = "Ok"
    detalhe = ""
    total = 0

    funcAfastados= FuncionarioRmAfastado.all

   

    # funcAfastados.each do |f|
    #   f.NomProfissional = f.NomProfissional.nil? ? "" : f.NomProfissional.force_encoding("ISO-8859-1").encode("UTF-8").split.map(&:capitalize).join(' ')
    #   f.NomEmailBRQ = f.NomEmailBRQ.nil? ? "" : f.NomEmailBRQ.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.IdtCPF = f.IdtCPF.nil? ? "" : f.IdtCPF.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.IdtRG = f.IdtRG.nil? ? "" : f.IdtRG.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.IdtCodigoCentroCusto = f.IdtCodigoCentroCusto.nil? ? "" : f.IdtCodigoCentroCusto.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.NomCentroCusto = f.NomCentroCusto.nil? ? "" : f.NomCentroCusto.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.NomTipoCentroCusto = f.NomTipoCentroCusto.nil? ? "" : f.NomTipoCentroCusto.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.IdtCodigoSecao = f.IdtCodigoSecao.nil? ? "" : f.IdtCodigoSecao.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.NomLocalTrabalho = f.NomLocalTrabalho.nil? ? "" : f.NomLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.NomCidadeLocalTrabalho = f.NomCidadeLocalTrabalho.nil? ? "" : f.NomCidadeLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.IdtCentroCustoTorre = f.IdtCentroCustoTorre.nil? ? "" : f.IdtCentroCustoTorre.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.DscCentroCustoTorre = f.DscCentroCustoTorre.nil? ? "" : f.DscCentroCustoTorre.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.NomGestorProfissional  = f.NomGestorProfissional.nil? ? "" : f.NomGestorProfissional.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.NomEmailGestorProfissional = f.NomEmailGestorProfissional.nil? ? "" : f.NomEmailGestorProfissional.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.NomEstadoLocalTrabalho = f.NomEstadoLocalTrabalho.nil? ? "" : f.NomEstadoLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.NomAlocacao = f.NomAlocacao.nil? ? "" : f.NomAlocacao.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.DscCentroCustoBU        = f.DscCentroCustoBU.nil? ? "" : f.DscCentroCustoBU.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.DscCentroCustoExecutivo = f.DscCentroCustoExecutivo.nil? ? "" : f.DscCentroCustoExecutivo.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.IdtCentroCustoBU        = f.IdtCentroCustoBU.nil? ? "" : f.IdtCentroCustoBU.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.IdtCentroCustoExecutivo = f.IdtCentroCustoExecutivo.nil? ? "" : f.IdtCentroCustoExecutivo.force_encoding("ISO-8859-1").encode("UTF-8")
    #   f.NomEmailPessoal         = f.NomEmailPessoal.nil? ? "" : f.NomEmailPessoal.force_encoding("ISO-8859-1").encode("UTF-8")
    # end

    # f2 = duas bases de dados de funcionarios (12115 registros)

    Funcionario.update_all("afastado=0")

    funcAfastados.each do |f|
      func = Funcionario.find_by_Login(f.Login)
      func.afastado = true
      func.DataInicioAfastamento = f.DTINICIO
      func.DataFinalAfastamento = f.DTFINAL
      func.save!
      total = total + 1
    end

    detalhe << "Funcionarios afastados: #{total}"


    Event.register("Carga","RM Func Afastados","detalhe","#{status} - #{detalhe}")

    [status,detalhe]
  end

end


