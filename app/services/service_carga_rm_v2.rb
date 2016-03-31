class ServiceCargaRmV2



  def init
    @comandoAdDemitidos = Parametro.get({:tipo => "ComandoAD", :subtipo => "FuncDesligado"})
    @comandoAdMudaramInterno = Parametro.get({:tipo => "ComandoAD", :subtipo => "MudancaIntExt"})
    @comandoAdMudaram = Parametro.get({:tipo => "ComandoAD", :subtipo => "MudancaLocal"})
    @comandoAdNovos = Parametro.get({:tipo => "ComandoAD", :subtipo => "NovoFunc"})
  end

  def normalizaFuncRM(funcRM)
  	funcRM.each do |f|
      f[1].NomProfissional = f[1].NomProfissional.nil? ? "" : f[1].NomProfissional.force_encoding("ISO-8859-1").encode("UTF-8").split.map(&:capitalize).join(' ')
      f[1].NomEmailBRQ = f[1].NomEmailBRQ.nil? ? "" : f[1].NomEmailBRQ.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].IdtCPF = f[1].IdtCPF.nil? ? "" : f[1].IdtCPF.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].IdtRG = f[1].IdtRG.nil? ? "" : f[1].IdtRG.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].IdtCodigoCentroCusto = f[1].IdtCodigoCentroCusto.nil? ? "" : f[1].IdtCodigoCentroCusto.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].NomCentroCusto = f[1].NomCentroCusto.nil? ? "" : f[1].NomCentroCusto.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].NomTipoCentroCusto = f[1].NomTipoCentroCusto.nil? ? "" : f[1].NomTipoCentroCusto.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].IdtCodigoSecao = f[1].IdtCodigoSecao.nil? ? "" : f[1].IdtCodigoSecao.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].NomLocalTrabalho = f[1].NomLocalTrabalho.nil? ? "" : f[1].NomLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].NomCidadeLocalTrabalho = f[1].NomCidadeLocalTrabalho.nil? ? "" : f[1].NomCidadeLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].IdtCentroCustoTorre = f[1].IdtCentroCustoTorre.nil? ? "" : f[1].IdtCentroCustoTorre.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].DscCentroCustoTorre = f[1].DscCentroCustoTorre.nil? ? "" : f[1].DscCentroCustoTorre.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].NomGestorProfissional  = f[1].NomGestorProfissional.nil? ? "" : f[1].NomGestorProfissional.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].NomEmailGestorProfissional = f[1].NomEmailGestorProfissional.nil? ? "" : f[1].NomEmailGestorProfissional.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].NomEstadoLocalTrabalho = f[1].NomEstadoLocalTrabalho.nil? ? "" : f[1].NomEstadoLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].NomAlocacao = f[1].NomAlocacao.nil? ? "" : f[1].NomAlocacao.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].DscCentroCustoBU        = f[1].DscCentroCustoBU.nil? ? "" : f[1].DscCentroCustoBU.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].DscCentroCustoExecutivo = f[1].DscCentroCustoExecutivo.nil? ? "" : f[1].DscCentroCustoExecutivo.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].IdtCentroCustoBU        = f[1].IdtCentroCustoBU.nil? ? "" : f[1].IdtCentroCustoBU.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].IdtCentroCustoExecutivo = f[1].IdtCentroCustoExecutivo.nil? ? "" : f[1].IdtCentroCustoExecutivo.force_encoding("ISO-8859-1").encode("UTF-8")
      f[1].NomEmailPessoal         = f[1].NomEmailPessoal.nil? ? "" : f[1].NomEmailPessoal.force_encoding("ISO-8859-1").encode("UTF-8")
    end

    funcRM
  end

  def atualizaFunc(fRM,f)
  	
  end


  def go

    ActiveRecord::Base.logger.level = 1

    init()

    status = "Ok"
    detalhe = ""
    total = 0

    temp = Funcionario.where(:NomEmailGestorProfissional => "magno")
    temp1 = Funcionario.where(:NomEmailGestorProfissional => "magno")


    func = Hash[temp.map {|f| [f.Login, f]}]
    funcRM = Hash[temp1.map {|f| [f.Login, f]}]
    funcRM = normalizaFuncRM(funcRM)


    antes = func.count * 1.0
    carga = funcRM.count * 1.0



    funcRM["renato"].DtaRemocaoAcesso = Time.now()
    funcRM["ale"].Login = "alecabrera"
    func["rbleckmann"].DtaRemocaoAcesso = Time.now()
    funcRM["clsouza"].NomAlocacao = "Externo"
    funcRM["salmeida"].NomAlocacao = "Externo"
    funcRM["aroldojunior"].IdLocalTrabalho = 111

    funcRM.each do |fRMtemp|
      fRM = fRMtemp[1]

      f = func[fRM.Login]

      # puts "#{fRM.Login} - #{fRM.DtaRemocaoAcesso} - #{f.DtaRemocaoAcesso}"

      if f.nil?
        puts "#{fRM.Login}: Funcionario Novo "
      elsif (! fRM.DtaRemocaoAcesso.nil?) and f.DtaRemocaoAcesso.nil?
        puts "#{fRM.Login}: Demitido "
      elsif (fRM.DtaRemocaoAcesso.nil?) and (! f.DtaRemocaoAcesso.nil?)
        puts "#{fRM.Login}: Readmitido "
      elsif (fRM.NomAlocacao != f.NomAlocacao)
        puts "#{fRM.Login}: Mudanca #{f.NomAlocacao} --> #{fRM.NomAlocacao}"
      elsif (fRM.IdLocalTrabalho != f.IdLocalTrabalho)
        puts "#{fRM.Login}: Mudanca de escritorio #{f.IdLocalTrabalho} --> #{fRM.IdLocalTrabalho}"
      end

      atualizaFunc(fRM,f)

    end


    # 
    #   fnew = Funcionario.find_or_create_by_Login(:Login => f.Login)
    #   fnew.NumMatrProfissional= f.NumMatrProfissional
    #   fnew.NomProfissional = f.NomProfissional.nil? ? "" : f.NomProfissional
    #   fnew.DtaAdmissao = f.DtaAdmissao
    #   fnew.DtaDemissao   = f.DtaDemissao
    #   fnew.DtaRemocaoAcesso  = f.DtaRemocaoAcesso.nil? ? "" : f.DtaRemocaoAcesso
    #   fnew.DtaRemocaoAcesso = (f.DtaRemocaoAcesso.nil? && ! f.DtaDemissao.nil?) ? f.DtaDemissao : fnew.DtaRemocaoAcesso
    #   fnew.NomEmailBRQ = f.NomEmailBRQ.nil? ? "" : f.NomEmailBRQ
    #   fnew.IdtCPF = f.IdtCPF.nil? ? "" : f.IdtCPF
    #   fnew.IdtRG = f.IdtRG.nil? ? "" : f.IdtRG
    #   fnew.IdtCodigoCentroCusto = f.IdtCodigoCentroCusto.nil? ? "" : f.IdtCodigoCentroCusto
    #   fnew.NomCentroCusto = f.NomCentroCusto.nil? ? "" : f.NomCentroCusto
    #   fnew.NomTipoCentroCusto = f.NomTipoCentroCusto.nil? ? "" : f.NomTipoCentroCusto
    #   fnew.IdtCodigoSecao = f.IdtCodigoSecao.nil? ? "" : f.IdtCodigoSecao
    #   fnew.IdLocalTrabalho = f.IdLocalTrabalho
    #   fnew.NomLocalTrabalho = f.NomLocalTrabalho.nil? ? "" : f.NomLocalTrabalho
    #   fnew.NomCidadeLocalTrabalho= f.NomCidadeLocalTrabalho.nil? ? "" : f.NomCidadeLocalTrabalho
    #   fnew.IdtCentroCustoTorre = f.IdtCentroCustoTorre.nil? ? "" : f.IdtCentroCustoTorre
    #   fnew.DscCentroCustoTorre = f.DscCentroCustoTorre.nil? ? "" : f.DscCentroCustoTorre
    #   fnew.NomAlocacao = f.NomAlocacao.nil? ? "" : f.NomAlocacao

    #   fnew.FlgIndicaRetorno  = f.FlgIndicaRetorno.nil? ? "" : f.FlgIndicaRetorno
    #   fnew.NomGestorProfissional  = f.NomGestorProfissional.nil? ? "" : f.NomGestorProfissional
    #   fnew.NomEmailGestorProfissional  = f.NomEmailGestorProfissional.nil? ? "" : f.NomEmailGestorProfissional.gsub(/@brq.com/,"")
    #   fnew.NomEstadoLocalTrabalho  = f.NomEstadoLocalTrabalho.nil? ? "" : f.NomEstadoLocalTrabalho

    #   fnew.DscCentroCustoBU        = f.DscCentroCustoBU.nil?        ? "" : f.DscCentroCustoBU
    #   fnew.DscCentroCustoExecutivo = f.DscCentroCustoExecutivo.nil? ? "" : f.DscCentroCustoExecutivo
    #   fnew.IdtCentroCustoBU        = f.IdtCentroCustoBU.nil?        ? "" : f.IdtCentroCustoBU
    #   fnew.IdtCentroCustoExecutivo = f.IdtCentroCustoExecutivo.nil? ? "" : f.IdtCentroCustoExecutivo
    #   fnew.NomEmailPessoal         = f.NomEmailPessoal.nil?         ? "" : f.NomEmailPessoal



    #   fnew.save!

    #   total = total + 1
   
    Gestores.invalidate # fazer um pub sub com broadcast disso..

    depois = Funcionario.count * 1.0
    detalhe << " - Antes: #{antes} - Carga: #{carga} - Depois: #{depois}"
    Event.register("Carga","RM","detalhe","#{status} - #{detalhe}")

    [status,detalhe]
  end

end
