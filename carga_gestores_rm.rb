js = {}
File.open("RM","r") do |fi|
	js = fi.read
end
funcionarios = JSON.parse(js)



funcionarios.each do |func|
	ci_func = Ci.find_by_chave(func["NumMatrProfissional"])

    gestor = funcionarios.find { |f| f["NomProfissional"]==func["OwnerCC"]}
    
    if ! gestor.nil?
	    ci_gestor = Ci.find_by_chave(gestor["NumMatrProfissional"])
		if ! ci_gestor.nil?
			if ci_func.impactados.count == 0 
				puts "1 #{ci_func.descricao} <-- #{ci_gestor.descricao}"
				ci_func.impactados << ci_gestor if ci_func.id != ci_gestor.id
				ci_func.save
			elsif ci_func.impactados[0].id != ci_gestor.id
				ci_func.impactados.delete_all
				ci_func.impactados << ci_gestor if ci_func.id != ci_gestor.id
				puts "2 #{ci_func.descricao} <-- #{ci_gestor.descricao}"
				ci_func.save
			end
		end
	end
end


# ci_func = Ci.find_by_chave(520)
# gestor = funcionarios.find { |f| f["NomProfissional"]==func["OwnerCC"]}
# ci_gestor = Ci.find_by_chave(gestor["NumMatrProfissional"])  

# if ! ci_gestor.nil?
# 	if ci_func.impactados.count == 0 
# 		ci_func.impactados << ci_gestor
# 	elsif ci_func.impactados[0].id != ci_gestor.id
# 		ci_func.impactados.delete_all
# 		ci_func.impactados << ci_gestor
# 	end
# end