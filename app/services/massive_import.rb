require 'csv'
class MassiveImport




def self.go(configfile)

	total_replaced = 0
	total_created = 0

    if configfile.kind_of? Rake::TaskArguments    	
    	
    	config = JSON.parse(File.read(configfile[:configfile]))
    	arquivo = config["arquivo"]
    end

    if configfile.kind_of? String
    	arquivo = configfile
    end

    log = config["log"]==1
    if log
    	puts "Log Mode"
    end

    teste_mode = config["teste"]==1
    if teste_mode
    	puts "Teste Mode"
    end


    if ! File.exist?(arquivo)
    	puts "arquivo nao exite. Terminando tarefa"
    	return "Erro"
    end
    

	dados = CSV.read(arquivo, {:headers => true, :col_sep => ',', :encoding => 'UTF-8'})
	dados.each do |linha|
		chave = linha[:chave.to_s].gsub("\t","").strip
		# if teste_mode
		#    c = Ci.new
		# else 
		   c = Ci.find_or_initialize_by(chave: chave)
		# end
		if c.id.nil?
			total_created = total_created + 1
		else
			total_replaced = total_replaced + 1 
			puts "ANTES:  #{c}" if log
		end

		# seto os valores default. Tem que ficar antes da carga, para setar qual tipoci..
		config["default"].each do |k,v|
			 c.send("#{k}=",v) if (k =~ /^[a-zA-Z0-9][a-zA-Z0-9_]+$/) && c.respond_to?(k) 
		end

		# importo o que pertence ao CI basico (nao comeca com underscore)
		dados.headers.each do |h|
			c.send("#{h}=",linha[h].gsub("\t","").strip) if (h =~ /^[a-zA-Z0-9][a-zA-Z0-9_]+$/) && c.respond_to?(h) && ! linha[h].nil?
		
		end



		c.statusci_id=1 if c.statusci_id.nil? 
		c.site_id=1 if c.site_id.nil?
		c.Owner = c.notificacao if c.Owner.nil?

		puts "DEPOIS: #{c}" if log

		# importo o que pertence aos atributos (comeca com underscore)
		if ! teste_mode
			c.save
			# seto os valores default dos atributos.
			config["default"].each do |k,v|
				c.send("#{k}=",v) if (k =~ /^_[a-zA-Z0-9][a-zA-Z0-9_]+$/) && c.respond_to?(k) 
		    end
			dados.headers.each do |h|
				c.send("#{h}=",linha[h].gsub("\t","").strip) if (h =~ /^_([a-zA-Z0-9_]+)$/)  && c.respond_to?(h)  && ! linha[h].nil?
			end
			c.save
		end
	end
	puts "done"
	puts "Total de registros criado #{total_created}"
	puts "Total de registros atualizados #{total_replaced}"
	"OK"
end

end