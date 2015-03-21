module CustomCi

	#ActiveRecord::Base::scope :licencas_em_estoque, ->(search) { ActiveRecord::Base::where("statusci_id = 8 and chave LIKE ?", "#{search}%") }
	# And then you'd call it like this:
	# YourModel.active.name_like("Bunnies")

	# def licencas_em_estoque(search)
 #        ActiveRecord::Base::where("statusci_id = 8 and chave LIKE ?","#{search}%")
 #    end

    # puts "Definindo Delete licenca"
    def desaloca_licenca
  		self.statusci_id = 8
  		self.CCDebito = ""
  		self.ProjetoDebito = ""
  		self.Owner = "BRQ"
  		self.notificacao = ""
  		save!
  	end
end

Ci.send(:include, CustomCi)
