class ServiceCargaRm

  def go
    status = "Ok"
    detalhe = ""
    total = 0

    funcRm = FuncionarioRm.all
    func= Funcionario.all

    antes = func.count * 1.0
    carga = funcRm.count * 1.0

    funcRm.each do |f|

      # f.NomProfissional = f.NomProfissional.nil? ? "" : f.NomProfissional.split.map(&:capitalize).join(' ')
      f.NomProfissional = f.NomProfissional.nil? ? "" : f.NomProfissional.split.map(&:capitalize).join(' ')
      f.NomEmailBRQ = f.NomEmailBRQ.nil? ? "" : f.NomEmailBRQ
      f.IdtCPF = f.IdtCPF.nil? ? "" : f.IdtCPF
      f.IdtRG = f.IdtRG.nil? ? "" : f.IdtRG
      f.IdtCodigoCentroCusto = f.IdtCodigoCentroCusto.nil? ? "" : f.IdtCodigoCentroCusto
      f.NomCentroCusto = f.NomCentroCusto.nil? ? "" : f.NomCentroCusto
      f.NomTipoCentroCusto = f.NomTipoCentroCusto.nil? ? "" : f.NomTipoCentroCusto
      f.IdtCodigoSecao = f.IdtCodigoSecao.nil? ? "" : f.IdtCodigoSecao
      f.NomLocalTrabalho = f.NomLocalTrabalho.nil? ? "" : f.NomLocalTrabalho
      f.NomCidadeLocalTrabalho = f.NomCidadeLocalTrabalho.nil? ? "" : f.NomCidadeLocalTrabalho
      f.IdtCentroCustoTorre = f.IdtCentroCustoTorre.nil? ? "" : f.IdtCentroCustoTorre
      f.DscCentroCustoTorre = f.DscCentroCustoTorre.nil? ? "" : f.DscCentroCustoTorre
      f.NomGestorProfissional  = f.NomGestorProfissional.nil? ? "" : f.NomGestorProfissional
      f.NomEmailGestorProfissional = f.NomEmailGestorProfissional.nil? ? "" : f.NomEmailGestorProfissional
      f.NomEstadoLocalTrabalho = f.NomEstadoLocalTrabalho.nil? ? "" : f.NomEstadoLocalTrabalho
      f.NomAlocacao = f.NomAlocacao.nil? ? "" : f.NomAlocacao
      f.DscCentroCustoBU        = f.DscCentroCustoBU.nil? ? "" : f.DscCentroCustoBU
      f.DscCentroCustoExecutivo = f.DscCentroCustoExecutivo.nil? ? "" : f.DscCentroCustoExecutivo
      f.IdtCentroCustoBU        = f.IdtCentroCustoBU.nil? ? "" : f.IdtCentroCustoBU
      f.IdtCentroCustoExecutivo = f.IdtCentroCustoExecutivo.nil? ? "" : f.IdtCentroCustoExecutivo
      f.NomEmailPessoal         = f.NomEmailPessoal.nil? ? "" : f.NomEmailPessoal
    end

    # f2 = duas bases de dados de funcionarios (12115 registros)

    f2 = (funcRm+func).map { |f| { login: f.Login.strip, remocaoAcesso: f.DtaRemocaoAcesso, local: f.IdLocalTrabalho ,interno: f.NomAlocacao, fullname: f.NomProfissional, cpf: f.IdtCPF }}.group_by { |func| func[:login]}.each { |login, infos| infos.map! { |f| [f[:remocaoAcesso], f[:local], f[:interno], f[:fullname], f[:cpf]]}}

  
    # Contratados sao os que so constam numa base de dados, logo o group acima so retornou um valor (38)
    novos = f2.map { |k,v| {k => v} if v[1].nil? }.delete_if { |k| k.nil?}

    # Retiros os contratados (12077) ou recem contratados sem local ainda definido
    f2.delete_if { |k,v|  v[1].nil?  || v[0][1].nil?}



    # Retiro os que nao mudaram, nao foram demitidos, nem mudaram de local (213)
    f2.delete_if { |k,v|  (! v[0].nil?) and (! v[1].nil?) and  (v[0][1]==v[1][1]) && (v[0][0] == v[1][0]) && v[0][2] == v[1][2] }

    # Demitidos sao que que tem data de demissao distinta (1o campo do array) (188)
    demitidos = f2.map { |k,v| {k => v} unless v[1][0] == v[0][0] }.delete_if { |k| k.nil?}


    mudaramInterno = f2.map { |k,v| {k => v} unless v[1][2] == v[0][2] }.delete_if { |k| k.nil?}


    # retiros os demitidos. (25). Sobrarao os que mudaram de localidade e/ou interno/externo
    mudaram = f2.delete_if { |k,v| v[1][0] != v[0][0] || ! v[0][0].nil? }

    comandoAdDemitidos = Parametro.get({:tipo => "ComandoAD", :subtipo => "FuncDesligado"})
    comandoAdMudaramInterno = Parametro.get({:tipo => "ComandoAD", :subtipo => "MudancaIntExt"})
    comandoAdMudaram = Parametro.get({:tipo => "ComandoAD", :subtipo => "MudancaLocal"})
    comandoAdNovos = Parametro.get({:tipo => "ComandoAD", :subtipo => "NovoFunc"})




    novos.count
    demitidos.count
    mudaram.count


    funcRm.each do |f|
      fnew = Funcionario.find_or_create_by(:Login => f.Login)
      fnew.NumMatrProfissional= f.NumMatrProfissional
      fnew.NomProfissional = f.NomProfissional.nil? ? "" : f.NomProfissional
      fnew.DtaAdmissao = f.DtaAdmissao
      fnew.DtaDemissao   = f.DtaDemissao
      fnew.DtaRemocaoAcesso  = f.DtaRemocaoAcesso.nil? ? "" : f.DtaRemocaoAcesso
      fnew.DtaRemocaoAcesso = (f.DtaRemocaoAcesso.nil? && ! f.DtaDemissao.nil?) ? f.DtaDemissao : fnew.DtaRemocaoAcesso
      fnew.NomEmailBRQ = f.NomEmailBRQ.nil? ? "" : f.NomEmailBRQ
      fnew.IdtCPF = f.IdtCPF.nil? ? "" : f.IdtCPF
      fnew.IdtRG = f.IdtRG.nil? ? "" : f.IdtRG
      fnew.IdtCodigoCentroCusto = f.IdtCodigoCentroCusto.nil? ? "" : f.IdtCodigoCentroCusto
      fnew.NomCentroCusto = f.NomCentroCusto.nil? ? "" : f.NomCentroCusto
      fnew.NomTipoCentroCusto = f.NomTipoCentroCusto.nil? ? "" : f.NomTipoCentroCusto
      fnew.IdtCodigoSecao = f.IdtCodigoSecao.nil? ? "" : f.IdtCodigoSecao
      fnew.IdLocalTrabalho = f.IdLocalTrabalho
      fnew.NomLocalTrabalho = f.NomLocalTrabalho.nil? ? "" : f.NomLocalTrabalho
      fnew.NomCidadeLocalTrabalho= f.NomCidadeLocalTrabalho.nil? ? "" : f.NomCidadeLocalTrabalho
      fnew.IdtCentroCustoTorre = f.IdtCentroCustoTorre.nil? ? "" : f.IdtCentroCustoTorre
      fnew.DscCentroCustoTorre = f.DscCentroCustoTorre.nil? ? "" : f.DscCentroCustoTorre
      fnew.NomAlocacao = f.NomAlocacao.nil? ? "" : f.NomAlocacao
      
      fnew.FlgIndicaRetorno  = f.FlgIndicaRetorno.nil? ? "" : f.FlgIndicaRetorno
      fnew.NomGestorProfissional  = f.NomGestorProfissional.nil? ? "" : f.NomGestorProfissional
      fnew.NomEmailGestorProfissional  = f.NomEmailGestorProfissional.nil? ? "" : f.NomEmailGestorProfissional.gsub(CONFIG["mail"]["domain"],"")
      fnew.NomEstadoLocalTrabalho  = f.NomEstadoLocalTrabalho.nil? ? "" : f.NomEstadoLocalTrabalho

      fnew.DscCentroCustoBU        = f.DscCentroCustoBU.nil?        ? "" : f.DscCentroCustoBU
      fnew.DscCentroCustoExecutivo = f.DscCentroCustoExecutivo.nil? ? "" : f.DscCentroCustoExecutivo
      fnew.IdtCentroCustoBU        = f.IdtCentroCustoBU.nil?        ? "" : f.IdtCentroCustoBU
      fnew.IdtCentroCustoExecutivo = f.IdtCentroCustoExecutivo.nil? ? "" : f.IdtCentroCustoExecutivo
      fnew.NomEmailPessoal         = f.NomEmailPessoal.nil?         ? "" : f.NomEmailPessoal



      fnew.save!

      total = total + 1
    end

    #TODO mudar para BRE....
    Gestores.invalidate
    Funcionario.invalidate

    depois = Funcionario.count * 1.0

    detalhe << " - Antes: #{antes} - Carga: #{carga} - Depois: #{depois}"

    puts "-----------------------"

    puts mudaram
    puts "-----------------------"

    puts "-----------------------"
    puts mudaramInterno
    puts "-----------------------"

    Event.register("Carga","RM","detalhe","#{status} - #{detalhe}")

    [status,detalhe]
  end

end


