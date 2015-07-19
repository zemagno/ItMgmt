class ServiceCargaRm

def go
	status = "Ok"
	detalhe = ""
	total = 0

	funcRm = FuncionarioRm.all
    func= Funcionario.all

    antes = func.count *1.0
	carga = funcRm.count * 1.0


	# f2 = duas bases de dados de funcionarios (12115 registros)
	f2 = (funcRm+func).map { |f| { login: f.Login, demissao: f.DtaDemissao, local: f.NomLocalTrabalho }}.group_by { |func| func[:login]}.each { |login, infos| infos.map! { |f| [f[:demissao], f[:local]]}}
  


	# Contratados sao os que so constam numa base de dados, logo o group acima so retornou um valor (38)
	novos = f2.map { |k,v| {k => v} if v[1].nil? }.delete_if { |k| k.nil?}

	# Retiros os contratados (12077)
	f2.delete_if { |k,v|  v[1].nil? }

	# Retiro os que nao mudaram nao foram demitidos nem mudaram de local (213)
	f2.delete_if { |k,v|  (! v[0].nil?) and (! v[1].nil?) and  (v[0][1]==v[1][1]) && (v[0][0] == v[1][0])}

	# Demitidos sao que que tem data de demissao distinta (1o campo do array) (188)
	demitidos = f2.map { |k,v| {k => v} unless v[1][0] == v[0][0] }.delete_if { |k| k.nil?}

	# retiros os demitidos. (25)
	mudaram = f2.delete_if { |k,v| v[1][0] != v[0][0]}

	novos.count
	demitidos.count
	mudaram.count

	Funcionario.delete_all

	funcRm.each do |f|
		   # Funcionario.create(f.attributes )
		   Funcionario.create(:Login => f.Login,
		   						:NumMatrProfissional=> f.NumMatrProfissional,
		   						:NomProfissional => f.NomProfissional.nil? ? "" : f.NomProfissional.force_encoding("ISO-8859-1").encode("UTF-8")    ,
		   						:DtaAdmissao => f.DtaAdmissao    ,
		   						:DtaDemissao   => f.DtaDemissao  ,
		   						:NomEmailBRQ => f.NomEmailBRQ.nil? ? "" : f.NomEmailBRQ.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:IdtCPF => f.IdtCPF.nil? ? "" : f.IdtCPF.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:IdtRG => f.IdtRG.nil? ? "" : f.IdtRG.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:IdtCodigoCentroCusto => f.IdtCodigoCentroCusto.nil? ? "" : f.IdtCodigoCentroCusto ,
		   						:NomCentroCusto => f.NomCentroCusto.nil? ? "" : f.NomCentroCusto.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:NomTipoCentroCusto => f.NomTipoCentroCusto.nil? ? "" : f.NomTipoCentroCusto.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:OwnerCC => f.OwnerCC.nil? ? "" : f.OwnerCC.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:IdtCodigoSecao => f.IdtCodigoSecao.nil? ? "" : f.IdtCodigoSecao.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:NomLocalTrabalho => f.NomLocalTrabalho.nil? ? "" : f.NomLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:NomCidadeLocalTrabalho=> f.NomCidadeLocalTrabalho.nil? ? "" : f.NomCidadeLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:IdtCentroCustoTorre => f.IdtCentroCustoTorre.nil? ? "" : f.IdtCentroCustoTorre.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:DscCentroCustoTorre => f.DscCentroCustoTorre.nil? ? "" : f.DscCentroCustoTorre.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:NomAlocacao => f.NomAlocacao.nil? ? "" : f.NomAlocacao.force_encoding("ISO-8859-1").encode("UTF-8") )
            total = total + 1
	end

	depois = Funcionario.count * 1.0
		
	detalhe << " - Antes: #{antes} - Carga: #{carga} - Depois: #{depois}"
	
	[status,detalhe]
end

end

		   Funcionario.create(:Login => f.Login,
		   						:Matricula=> f.NumMatrProfissional,
		   						:Nome => f.NomProfissional    ,
		   						:DataAdmissao => f.DtaDemissao    ,
		   						:DataDemissao   => f.DtaAdmissao  ,
		   						:Email => f.NomEmailBRQ ,
		   						:CPF => f.IdtCPF ,
		   						:Identidade => f.IdtRG ,
		   						:CodigoCC => f.IdtCodigoCentroCusto ,
		   						:NomeCC => f.NomCentroCusto.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:NomeTipoCC => f.NomTipoCentroCusto.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:OwnerCC => f.OwnerCC ,
		   						:CodigoSecao => f.IdtCodigoSecao ,
		   						:NomeLocalTrabalho => f.NomLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:NomeCidadeTrabalho=> f.NomCidadeLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:CCTorre => f.IdtCentroCustoTorre ,
		   						:DescCCTorre => f.DscCentroCustoTorre.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   						:NomAlocacao => f.NomAlocacao.force_encoding("ISO-8859-1").encode("UTF-8") )



