require 'csv'
class ServiceCargaIdentity

def go

	detalhe = ""

	total_replaced = 0
	total_created = 0

	Identity.delete_all
   	path = Parametro.get(:tipo => "PATH", :subtipo => "MassiveImportIdentities")
   	config = JSON.parse(File.read(path))

    config.each do |provider, file|   
		dados = CSV.read(file, headers: true)
		detalhe << "Provider #{provider} - "
		dados.each do |linha|
			chave = linha[:User.to_s].gsub("\t","").strip if provider=="AD"
			chave = linha[:primaryEmail.to_s].gsub("\t","").strip.gsub!(/@[^\s]+/,"") if provider=="Google"
			chave = linha[:User.to_s].gsub("\t","").strip.gsub(/@[^\s]+/,"") if provider=="Zimbra" || provider="ZMail"
			idt = Identity.find_or_initialize_by_login(chave)
			if idt.id.nil?
				total_created = total_created + 1
			else
				total_replaced = total_replaced + 1 
			end

			

			# dados.headers.each do |h|
			# 	linha[h] = linha[h].upcase if linha[h]=="True"
			# 	idt.send("#{provider}#{h}=",linha[h].gsub("\t","").strip) if idt.respond_to?("#{provider}#{h}") && ! linha[h].nil?
			# end
			dados.headers.each do |h|
                linha[h] = linha[h].upcase if linha[h]=="True"
                idt.send("#{provider}#{h}=",linha[h].gsub("\t","").gsub(/@[^\s]+/,"").strip) if idt.respond_to?("#{provider}#{h}") && ! linha[h].nil?
            end
  			
			idt.save! 
		end
		detalhe << "Total de registros criado #{total_created} - "
		detalhe << "Total de registros atualizados #{total_replaced}"
	end
  
  	detalhe << "Provider: Funcionario"  
    Funcionario.all.each do |f|
    	idt = Identity.find_or_initialize_by_login(f.Login)
    	if idt.id.nil?
				total_created = total_created + 1
			else
				total_replaced = total_replaced + 1 
		end
    	idt.RMLogin = f.Login
    	idt.RMDataAdmissao = f.DataAdmissao
    	idt.RMDataDemissao = f.DataRemocaoAcesso
    	idt.RMInterno      = f.NomAlocacao
    	idt.save!
    end

	detalhe << "Total de registros criado #{total_created} - "
	detalhe << "Total de registros atualizados #{total_replaced}"
	
	status = "Ok"
		
	Event.register("Carga","Identities","detalhe","#{status} - #{detalhe}")
	[status,detalhe]
end

end