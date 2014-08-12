js = {}
File.open("RM","r") do |fi|
	js = fi.read
end
funcionarios = JSON.parse(js)


localidades = CustomDePara.all
sites = Site.all

funcionarios.each do |f|
	ci = Ci.find_by_chave(f["NumMatrProfissional"])
	if ci.nil?
		ci = Ci.new({chave: f["NumMatrProfissional"], Owner: f["NomEmailBRQ"], descricao: f["NomProfissional"], tipoci_id: 40}) 
	end
	ci.statusci_id = (f["DtaDemissao"].nil? ? 1 : 2)

    l = localidades.find{ |l| l.de == f["NomLocalTrabalho"]}
    ci.site_id = (l.nil? ? 1 : sites.find{|s| s.nome == l.para }.id)
    ci.CCDebito  =   f["IdtCentroCusto"]
    ci.save
    ci.atributos = {"CPF"=>f["IdtCPF"], "Identidade"=>f["IdtRG"], "Local Trabalho"=>f["NomLocalTrabalho"], "Data Admissao"=>f["DtaAdmissao"], "Data Demissao"=>f["DtaDemissao"]}
    ci.limpa_atributos_outros_tipo
    
end


# procuro por func,gestor
# se nao achar,
#    procuro por ?, func e esse ? é func (acharei o antigo gestor), entao apago
#    crio func,gestor
# end

# | CPF                                       | CPF               |
# | Identidade                                | Identidade        |
# | Local Trabalho                            | localtrabalho     |
# | Data Admissao                             | dataadmissao      |
# | Data Demissao                             | datademissao      |
