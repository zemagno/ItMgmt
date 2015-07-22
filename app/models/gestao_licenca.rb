class GestaoLicenca

	def self.LiberaLicenca(attributes = {})
		
		c = Ci.find_by_chave(attributes[:licenca])
        
		c.desaloca_licenca if ! c.nil?
	end

	def self.AlocarLicenca(attributes = {})
		
		puts attributes

		licencas = GestaoLicenca.LicencasExistentes.detect {|n| n[0] == attributes[:licenca]}
 
 		
 		licenca_disponivel = nil
  		licencas[1].each do |k|
  			if (licenca_disponivel=Ci.find_by_descricao_and_statusci_id(k,8))
  				break
  			end
  		end
		if licenca_disponivel      
        	licenca_disponivel.Owner = attributes[:gestor]
			licenca_disponivel.notificacao = attributes[:id]
			licenca_disponivel.CCDebito = attributes[:cc]
			licenca_disponivel.ProjetoDebito = attributes[:projeto]
			licenca_disponivel.statusci_id = 1
	        licenca_disponivel.save!
		end
		licenca_disponivel
	end

	def self.LicencasDisponiveis(search)
		l = Ci.where("tipoci_id = 13 and statusci_id = 8 and chave LIKE ?","#{search}%").map(&:descricao).uniq
		l
	end

	def self.LicencasExistentes
		l =JSON.parse Parametro.get({:tipo => "Licencas", :subtipo => "Catalogo"})
		l
	end
end