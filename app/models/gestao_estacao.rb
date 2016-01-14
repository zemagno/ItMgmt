class GestaoEstacao

	def self.LiberaEstacao(attributes = {})
		c = Ci.find_by_chave(attributes[:estacao]) 
		c.libera_estacao if ! c.nil?
	end

	def self.Atributos
		c = Ci.new
		c.tipoci_id=46
		atributos = c.atributos
		p = Parametro.get(:tipo => "Alocar",:subtipo => "Estacao")
        fields = p.split(",").map(&:to_i)
        atributos.delete_if { |k,v| ! fields.include?(k) }
		atributos
	end


	def self.AlocarEstacao(attributes = {})
		
		puts attributes
		estacao_disponivel = Ci.find_by_chave(attributes[:estacao])
		if estacao_disponivel and estacao_disponivel.tipoci_id==46 and estacao_disponivel.statusci_id == 8	
		    		
		    estacao_disponivel.Owner = attributes[:gestor]
		    estacao_disponivel.notificacao = attributes[:id]
		    estacao_disponivel.CCDebito = attributes[:cc]
		    estacao_disponivel.ProjetoDebito = attributes[:projeto]
			estacao_disponivel.statusci_id = 1
			attr_original = estacao_disponivel.atributos
	        estacao_disponivel.save!
	        attr = {}
	        attr_original.map {|k,v| attr[v[0]] = v[1] }
	        attr = attr.merge(attributes[:atributos])
	        estacao_disponivel.atributos = attr
	    else
	    	estacao_disponivel = nil
	    end
		estacao_disponivel
	end

end