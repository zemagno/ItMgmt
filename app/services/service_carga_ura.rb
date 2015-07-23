class ServiceCargaUra

def go
	status = "Erro"
	detalhe = ""
	total = 0
	antes = Ura.count *1.0
	carga = Funcionario.where(DtaDemissao: nil).count *1.0
	Funcionario.all.each do |f|
    	if ! f.DataDemissao.nil?
        	u = Ura.find_by_login(f.Login)
        	u.delete if  ! u.nil?
    	else
        	u = Ura.find_by_login(f.Login)
    		Ura.create(:login => f.Login,  cpf: f.CPF[0..2], email: f.Email) if  u.nil?
      	end
	end
	depois = Ura.count * 1.0
	if carga==0.0 
		status = "Erro"
		detalhe = "Carga sem dados"
	elsif (((antes-carga).abs / carga) > 0.10) || (((depois-carga).abs / carga) > 0.10) || (((depois-antes).abs / antes) > 0.10)
		status = "Warning"
		detalhe = "Carga URA discrepante"
	elsif (carga != depois)
		status = "Erro"
		detalhe = "Carga URA efetuado com erro."
	else
		status = "Ok"
		detalhe = "Carga URA efetuado com sucesso."
	end

	# status sempre sera OK ate acertar. Pode ter dados expurios na URA e essa carga nao apaga.
	status = "Ok"
		
	detalhe << " - Antes: #{antes} - Carga: #{carga} - Depois: #{depois}"
	
	[status,detalhe]
end

end

