class Funcionario < ActiveRecord::Base
  set_primary_key :Login
  attr_accessible  :Login,  :NumMatrProfissional,:NomProfissional,:DtaAdmissao,:DtaDemissao,:NomEmailBRQ,:IdtCPF,:IdtRG,:IdtCodigoCentroCusto,:NomCentroCusto,:NomTipoCentroCusto,:OwnerCC,:IdtCodigoSecao,:NomLocalTrabalho,:NomCidadeLocalTrabalho, :IdtCentroCustoTorre,:DscCentroCustoTorre, :NomAlocacao 


 alias_attribute :CCTorre ,			:IdtCentroCustoTorre
 alias_attribute :CPF,				:IdtCPF
 alias_attribute :CodigoCC,			:IdtCodigoCentroCusto
 alias_attribute :CodigoSecao, 		:IdtCodigoSecao
 alias_attribute :DataAdmissao, 	:DtaAdmissao
 alias_attribute :DataDemissao, 	:DtaDemissao
 alias_attribute :DescCCTorre, 		:DscCentroCustoTorre
 alias_attribute :Email,			:NomEmailBRQ
 alias_attribute :Identidade,		:IdtRG
 alias_attribute :Matricula, 		:NumMatrProfissional
 alias_attribute :Nome,				:NomProfissional
 alias_attribute :NomeCC,			:NomCentroCusto
 alias_attribute :NomeCidadeTrabalho,:NomCidadeLocalTrabalho
 alias_attribute :NomeLocalTrabalho,:NomLocalTrabalho
 alias_attribute :NomeTipoCC,  		:NomTipoCentroCusto
end
  
  
  


  
  
   
  
   


     