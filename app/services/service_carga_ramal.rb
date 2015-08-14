class ServiceCargaRamal

def go
	status = "Erro"
	detalhe = ""
	total = 0
	

	TelRamalLogin.all.group_by(&:IdtLogin).each do |login, ramais|
	    r = ramais.map { |r| "#{r.IdtLocalidade} - #{r.NumRamal.to_s}" }.join(" / ") 
	    f = Funcionario.find_by_Login(login)
	    if ! f.nil? &&  f.ramal != r
	    	puts "vou alterar ramal para #{r}"
	    	f.ramal = r
	    	puts f.NomProfissional
	    	puts f.ramal
	    	puts f.save!
	    	f.save!
	    	f.save
	    end
	end
	Funcionario.all.each do |f|
	    r = TelRamalLogin.find_by_IdtLogin(f.Login)
	    if r.nil?
	        f.ramal = ""
	        f.save
	    end
	end
	# status sempre sera OK ate acertar. Pode ter dados expurios na URA e essa carga nao apaga.
	status = "Ok"
		
 	total = Funcionario.where("ramal <> '' and ramal is not null").count

	detalhe << " Atualizado: total de #{total} ramais"

	Event.register("Carga","Ramal","detalhe","#{status} - #{detalhe}")
	
	[status,detalhe]
end

end

