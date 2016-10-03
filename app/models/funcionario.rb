class Funcionario < ActiveRecord::Base
  self.primary_key = "Login"
  attr_accessible  :Login,  :NumMatrProfissional,:NomProfissional,:DtaAdmissao,:DtaDemissao,:NomEmailBRQ,:IdtCPF,:IdtRG,:IdtCodigoCentroCusto,:NomCentroCusto,:NomTipoCentroCusto,:IdtCodigoSecao,:NomLocalTrabalho,:NomCidadeLocalTrabalho, :IdtCentroCustoTorre,:DscCentroCustoTorre, :NomAlocacao, :IdLocalTrabalho, :cipa, :semEstacao, :observacao, :brigadista, :afastado,
    :DtaRemocaoAcesso, :FlgIndicaRetorno, :NomGestorProfissional, :NomEmailGestorProfissional, :NomEstadoLocalTrabalho,
    :ramalSendoExterno, :customPossuiVariasEstacoes, :customExternoComOffice365


  alias_attribute :CCTorre ,      :IdtCentroCustoTorre
  alias_attribute :CPF,       :IdtCPF
  alias_attribute :CodigoCC,      :IdtCodigoCentroCusto
  alias_attribute :CodigoSecao,     :IdtCodigoSecao
  alias_attribute :DataAdmissao,  :DtaAdmissao
  alias_attribute :DataDemissao,  :DtaDemissao
  alias_attribute :DataRemocaoAcesso,  :DtaRemocaoAcesso
  alias_attribute :DescCCTorre,     :DscCentroCustoTorre
  alias_attribute :Email,     :NomEmailBRQ
  alias_attribute :LoginGestor,     :NomEmailGestorProfissional
  alias_attribute :NomeGestor,      :NomGestorProfissional
  alias_attribute :Identidade,    :IdtRG
  alias_attribute :Matricula,     :NumMatrProfissional
  alias_attribute :Nome,        :NomProfissional
  alias_attribute :NomeCC,      :NomCentroCusto
  alias_attribute :NomeCidadeTrabalho,:NomCidadeLocalTrabalho
  alias_attribute :NomeLocalTrabalho,:NomLocalTrabalho
  alias_attribute :NomeTipoCC,      :NomTipoCentroCusto
  # alias_attribute :gestor,      :NomEmailGestorProfissional

  @@funcionarios  = nil

  def status
    status_func = ""
    status_func << "Afastado - " if self.afastado
    status_func << "Sem Estacao - " if self.semEstacao
    status_func << (self.observacao || "" ) if  self.semEstacao || self.afastado
    status_func
  end

  def demitido?
    ! self.DataRemocaoAcesso.nil? and self.DataRemocaoAcesso < DateTime.now
  end

  @@funcionarios = nil

  def gestor
    self.NomEmailGestorProfissional.gsub(CONFIG["mail"]["domain"],"")
  end

  def self._all
    if not @@funcionarios
      @@funcionarios = {}
      Funcionario.where(DtaDemissao: nil).each { |f| @@funcionarios[f.Login] = f}
    end
    @@funcionarios
  end

  def self.invalidate
    @@funcionarios = nil
  end


  # colocar navegacao sem precisar ir no bd. 
  # self
  # e gestores chama com (login)

  def self.gestores (login)
    f = Funcionario._all
    gestores = []
    gestor = login
    fim = false
    while not fim
      gestores << [gestor,f[gestor].NomProfissional, "#{f[gestor].NomeTipoCC}/#{f[gestor].DescCCTorre}", f[gestor].ramal]
      gestor = f[gestor].NomEmailGestorProfissional
      fim = gestor =="benjamin" || gestor.nil?
    end
    gestores << [gestor,f[gestor].NomProfissional]
    gestores
  end

  def gestores
    Funcionario.gestores(self.Login)

  end

  def self.funcionarios(login)
    f = Funcionario._all
    funcionarios = []
    f.each { |k,v| funcionarios << [v.Login,v.NomProfissional,v.ramal] if v.NomEmailGestorProfissional == login }
    funcionarios
  end

  def funcionarios
    Funcionario.funcionarios(self.Login)
  end


end
