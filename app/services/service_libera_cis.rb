class ServiceLiberaCis
	def go
  		params = Hash[JSON.parse Parametro.get(:tipo => "CI", :subtipo => "Liberar")]
    	filtro = params.map { |x| x[0].to_i }
    	Ci.where(tipoci_id: filtro).find_each do |ci|
	      	if ci.notificacao =~ /^[a-zA-z.]+$/
	        	f = Funcionario.find_by_Login(ci.notificacao)
	       		if ! f.nil? and ! f.demitido?
	          		cmds = params[ci.tipoci_id.to_s]
	          		cmds.each do |cmd|
	            		attr=cmd.split("=")[0]
	            		v=cmd.split("=")[1]
	            		ci.send("#{attr}=",v)
	          		end
	          		puts ci
	          		!ci.save
	          		Event.register("Acerta Ci","Liberar Licenca","detalhe","Liberado #{ci.chave}:#{ci.descricao} : #{f.Login} : desligamento em #{f.DataDemissao}")
	        	end
	      	end
    	end
	end
end



# insert into parametros (tipo,subtipo) value("CI","Liberar");
# [
#   ["13",["statusci_id=8","CCDebito= ","ProjetoDebito= ","Owner=BRQ","notificacao= "]]
# ]
