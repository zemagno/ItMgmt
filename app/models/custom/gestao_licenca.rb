class Custom::GestaoLicenca

	def self.LiberaLicenca(attributes = {})
		
		c = Ci.find_by_chave(attributes[:licenca])
        
		c.desaloca_licenca if ! c.nil?
	end

	def self.LicencasDisponiveis(search)
		l = Ci.where("tipoci_id = 13 and statusci_id = 8 and chave LIKE ?","#{search}%").map(&:descricao).uniq
	end

end