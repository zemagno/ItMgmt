class ServiceCargaRm

def go
	status = "Ok"
	detalhe = ""
	total = 0

	funcRm = FuncionarioRm.all
    func= Funcionario.all

    antes = func.count * 1.0
	carga = funcRm.count * 1.0


	# f2 = duas bases de dados de funcionarios (12115 registros)
	
	f2 = (funcRm+func).map { |f| { login: f.Login, demissao: f.DtaDemissao, local: (f.NomLocalTrabalho.nil? ? f.NomLocalTrabalho : f.NomLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8")),interno: f.NomAlocacao}}.group_by { |func| func[:login]}.each { |login, infos| infos.map! { |f| [f[:demissao], f[:local], f[:interno]]}}
 



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

	if comandoAdMudaram != "N/A" && ! comandoAdMudaram.nil?
		mudaram.each do |m|
	         cmd = comandoAdMudaram.dup
			
	         cmd.sub! "{{userid}}", m[0]
	         cmd.sub! "{{local_depois}}", m[1][0][1]
	         cmd.sub! "{{local_antes}}", m[1][1][1]
	         puts cmd
	         ProducaoAd.create(:userid => m[0], :parametro => m[1][0][1], :cmd => cmd, :acao => "MudancaLocal", :processado => false )
	    end
	end
	
	if comandoAdMudaramInterno != "N/A" && ! comandoAdMudaramInterno.nil?
		mudaramInterno.each do |m|
			 cmd = comandoAdMudaramInterno.dup
			 m1 = m.flatten
	         cmd.sub! "{{userid}}", m1[0]
	         cmd.sub! "{{local_depois}}", m1[1][0][2]
	         cmd.sub! "{{local_antes}}", m1[1][1][2]
	          puts cmd
	         ProducaoAd.create(:userid => m1[0], :parametro => m1[1][0][2], :cmd => cmd, :acao => "MudancaIntExt", :processado => false )
	    end
	end

 	if comandoAdNovos != "N/A" && ! comandoAdNovos.nil?
	    novos.each do |m|
	         puts "Gerar : #{m[0]} Novo #{m.flatten[1][0][1]}"
			 cmd = comandoAdNovos
	         cmd.sub! "{{userid}}", m.flatten[0]
	         cmd.sub! "{{local_antes}}", m.flatten[1][1][2]
	    end
	end

    if comandoAdDemitidos != "N/A" &&  ! comandoAdDemitidos.nil?
    	demitidos.each do |m|
        	puts "Gerar : #{m.flatten[0]} Demitidos #{m.flatten[1][0][1]}"
			cmd = comandoAdNovos
	        cmd.sub! "{{userid}}", m.flatten[0]
	        cmd.sub! "{{local_antes}}", m.flatten[1][1][2]
    	end
    end



	# Funcionario.delete_all

	funcRm.each do |f|
		   # Funcionario.create(f.attributes )
		    fnew = Funcionario.find_or_create_by_Login(:Login => f.Login) 
			fnew.NumMatrProfissional= f.NumMatrProfissional
			fnew.NomProfissional = f.NomProfissional.nil? ? "" : f.NomProfissional.force_encoding("ISO-8859-1").encode("UTF-8")    
			fnew.DtaAdmissao = f.DtaAdmissao    
			fnew.DtaDemissao   = f.DtaDemissao  
			fnew.NomEmailBRQ = f.NomEmailBRQ.nil? ? "" : f.NomEmailBRQ.force_encoding("ISO-8859-1").encode("UTF-8") 
			fnew.IdtCPF = f.IdtCPF.nil? ? "" : f.IdtCPF.force_encoding("ISO-8859-1").encode("UTF-8") 
			fnew.IdtRG = f.IdtRG.nil? ? "" : f.IdtRG.force_encoding("ISO-8859-1").encode("UTF-8") 
			fnew.IdtCodigoCentroCusto = f.IdtCodigoCentroCusto.nil? ? "" : f.IdtCodigoCentroCusto 
			fnew.NomCentroCusto = f.NomCentroCusto.nil? ? "" : f.NomCentroCusto.force_encoding("ISO-8859-1").encode("UTF-8") 
			fnew.NomTipoCentroCusto = f.NomTipoCentroCusto.nil? ? "" : f.NomTipoCentroCusto.force_encoding("ISO-8859-1").encode("UTF-8") 
			fnew.OwnerCC = f.OwnerCC.nil? ? "" : f.OwnerCC.force_encoding("ISO-8859-1").encode("UTF-8") 
			fnew.IdtCodigoSecao = f.IdtCodigoSecao.nil? ? "" : f.IdtCodigoSecao.force_encoding("ISO-8859-1").encode("UTF-8") 
			fnew.NomLocalTrabalho = f.NomLocalTrabalho.nil? ? "" : f.NomLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8") 
			fnew.NomCidadeLocalTrabalho= f.NomCidadeLocalTrabalho.nil? ? "" : f.NomCidadeLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8") 
			fnew.IdtCentroCustoTorre = f.IdtCentroCustoTorre.nil? ? "" : f.IdtCentroCustoTorre.force_encoding("ISO-8859-1").encode("UTF-8") 
			fnew.DscCentroCustoTorre = f.DscCentroCustoTorre.nil? ? "" : f.DscCentroCustoTorre.force_encoding("ISO-8859-1").encode("UTF-8") 
			fnew.NomAlocacao = f.NomAlocacao.nil? ? "" : f.NomAlocacao.force_encoding("ISO-8859-1").encode("UTF-8") 
			fnew.save!
		   # Funcionario.find_or_create_by_Login(:Login => f.Login,
		   # 						:NumMatrProfissional=> f.NumMatrProfissional,
		   # 						:NomProfissional => f.NomProfissional.nil? ? "" : f.NomProfissional.force_encoding("ISO-8859-1").encode("UTF-8")    ,
		   # 						:DtaAdmissao => f.DtaAdmissao    ,
		   # 						:DtaDemissao   => f.DtaDemissao  ,
		   # 						:NomEmailBRQ => f.NomEmailBRQ.nil? ? "" : f.NomEmailBRQ.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   # 						:IdtCPF => f.IdtCPF.nil? ? "" : f.IdtCPF.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   # 						:IdtRG => f.IdtRG.nil? ? "" : f.IdtRG.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   # 						:IdtCodigoCentroCusto => f.IdtCodigoCentroCusto.nil? ? "" : f.IdtCodigoCentroCusto ,
		   # 						:NomCentroCusto => f.NomCentroCusto.nil? ? "" : f.NomCentroCusto.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   # 						:NomTipoCentroCusto => f.NomTipoCentroCusto.nil? ? "" : f.NomTipoCentroCusto.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   # 						:OwnerCC => f.OwnerCC.nil? ? "" : f.OwnerCC.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   # 						:IdtCodigoSecao => f.IdtCodigoSecao.nil? ? "" : f.IdtCodigoSecao.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   # 						:NomLocalTrabalho => f.NomLocalTrabalho.nil? ? "" : f.NomLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   # 						:NomCidadeLocalTrabalho=> f.NomCidadeLocalTrabalho.nil? ? "" : f.NomCidadeLocalTrabalho.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   # 						:IdtCentroCustoTorre => f.IdtCentroCustoTorre.nil? ? "" : f.IdtCentroCustoTorre.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   # 						:DscCentroCustoTorre => f.DscCentroCustoTorre.nil? ? "" : f.DscCentroCustoTorre.force_encoding("ISO-8859-1").encode("UTF-8") ,
		   # 						:NomAlocacao => f.NomAlocacao.nil? ? "" : f.NomAlocacao.force_encoding("ISO-8859-1").encode("UTF-8") )


            total = total + 1
	end

	depois = Funcionario.count * 1.0
		
	detalhe << " - Antes: #{antes} - Carga: #{carga} - Depois: #{depois}"
	
    puts "-----------------------"

    puts mudaram
    puts "-----------------------"

    puts "-----------------------"
    puts mudaramInterno
    puts "-----------------------"

	[status,detalhe]
end

end

		 

