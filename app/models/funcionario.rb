class Funcionario < ActiveRecord::Base
  set_primary_key :Login
  attr_accessible :CCTorre, :CPF, :CodigoCC, :CodigoSecao, :DataAdmissao, :DataDemissao, :DescCCTorre, :Email, :Identidade, :Login, :Matricula, :Nome, :NomeCC, :NomeCidadeTrabalho, :NomeLocalTrabalho, :NomeTipoCC, :OwnerCC
end
