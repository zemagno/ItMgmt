class Funcionario < ActiveRecord::Base
  set_primary_key :Login
  attr_accessible  :Login,  :NumMatrProfissional,:NomProfissional,:DtaAdmissao,:DtaDemissao,:NomEmailBRQ,:IdtCPF,:IdtRG,:IdtCodigoCentroCusto,:NomCentroCusto,:NomTipoCentroCusto,:IdtCodigoSecao,:NomLocalTrabalho,:NomCidadeLocalTrabalho, :IdtCentroCustoTorre,:DscCentroCustoTorre, :NomAlocacao, :IdLocalTrabalho, :cipa, :semEstacao, :observacao, :brigadista, :afastado,
                   :DtaRemocaoAcesso, :FlgIndicaRetorno, :NomGestorProfissional, :NomEmailGestorProfissional, :NomEstadoLocalTrabalho,
                   :ramalSendoExterno


  alias_attribute :CCTorre ,			:IdtCentroCustoTorre
  alias_attribute :CPF,				:IdtCPF
  alias_attribute :CodigoCC,			:IdtCodigoCentroCusto
  alias_attribute :CodigoSecao, 		:IdtCodigoSecao
  alias_attribute :DataAdmissao, 	:DtaAdmissao
  alias_attribute :DataDemissao, 	:DtaDemissao
  alias_attribute :DataRemocaoAcesso,  :DtaRemocaoAcesso
  alias_attribute :DescCCTorre, 		:DscCentroCustoTorre
  alias_attribute :Email,     :NomEmailBRQ
  alias_attribute :LoginGestor,     :NomEmailGestorProfissional
  alias_attribute :NomeGestor,			:NomGestorProfissional
  alias_attribute :Identidade,		:IdtRG
  alias_attribute :Matricula, 		:NumMatrProfissional
  alias_attribute :Nome,				:NomProfissional
  alias_attribute :NomeCC,			:NomCentroCusto
  alias_attribute :NomeCidadeTrabalho,:NomCidadeLocalTrabalho
  alias_attribute :NomeLocalTrabalho,:NomLocalTrabalho
  alias_attribute :NomeTipoCC,      :NomTipoCentroCusto
  alias_attribute :gestor,  		:NomEmailGestorProfissional

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

end











