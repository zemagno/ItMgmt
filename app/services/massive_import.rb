require 'csv'
class MassiveImport




def self.go(configfile)
	# configfile  = "/Users/zemagno/Dropbox/dev/ror/ItMgmt/externos_bsb.csv"

    if configfile.kind_of? Rake::TaskArguments    	
    	
    	puts "Config file [#{configfile[:configfile]}]"
    	config = JSON.parse(File.read(configfile[:configfile]))
    	arquivo = config["arquivo"]
    	puts config
    end

    if configfile.kind_of? String
    	arquivo = configfile
    	puts "Config file #{arquivo}" 
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
    

	dados = CSV.read(arquivo, headers: true)
	dados.each do |linha|
		chave = linha[:chave.to_s].gsub("\t","").strip
		if teste_mode
		   c = Ci.new
		else 
		   c = Ci.find_or_initialize_by_chave(chave)
		end
		dados.headers.each do |h|
			c.send("#{h}=",linha[h].gsub("\t","").strip) if (h =~ /^([a-zA-Z]+)$/) && c.respond_to?(h)
		end

		config["default"].each do |k,v|
			 c.send("#{k}=",v)
		end

		c.statusci_id=1 if c.statusci_id.nil? 
		c.site_id=1 if c.site_id.nil?
		c.Owner = c.notificacao if c.Owner.nil?

		puts c if log

		c.save! if ! teste_mode

		dados.headers.each do |h|
			c.send("#{h}=",linha[h].gsub("\t","").strip) if (h =~ /^(_[a-zA-Z]+)$/)  && c.respond_to?(h)
		end
		c.save! if ! teste_mode
	end
	puts "done"
	"OK"
end

end