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
	f2 = (funcRm+func).map { |f:{ login: f.Login, demissao: f.DataDemissao, local: f.NomeLocalTrabalho }}.group_by { |func:func[:login]}.each { |login, infos| infos.map! { |f| [f[:demissao], f[:local]]}}

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
		   Funcionario.create(f.atributes )
		   total = total + 1
		end

	depois = Funcionario.count * 1.0
		
	detalhe << " - Antes: #{antes} - Carga: #{carga} - Depois: #{depois}"
	
	[status,detalhe]
end

end

		   # Funcionario.create(:Login => f.Login,
		   # 						:Matricula=> f.NumMatrProfissional,
		   # 						:Nome => f.NomProfissional    ,
		   # 						:DataAdmissao => f.DtaDemissao    ,
		   # 						:DataDemissao   => f.DtaAdmissao  ,
		   # 						:Email => f.NomEmailBRQ ,
		   # 						:CPF => f.IdtCPF ,
		   # 						:Identidade => f.IdtRG ,
		   # 						:CodigoCC => f.IdtCodigoCentroCusto ,
		   # 						:NomeCC => f.NomCentroCusto ,
		   # 						:NomeTipoCC => f.NomTipoCentroCusto ,
		   # 						:OwnerCC => f.OwnerCC ,
		   # 						:CodigoSecao => f.IdtCodigoSecao ,
		   # 						:NomeLocalTrabalho => f.NomLocalTrabalho ,
		   # 						:NomeCidadeTrabalho=> f.NomCidadeLocalTrabalho ,
		   # 						:CCTorre => f.IdtCentroCustoTorre ,
		   # 						:DescCCTorre => f.DscCentroCustoTorre ,
		   # 						:NomAlocacao => f.NomAlocacao )



