class ListaEmail

	def self.acerta(lista, sufixo)
		lista.gsub(/\s+/, "").split(",").compact.uniq.delete_if { |c| c == "" }.collect{ |s| s+sufixo  }.join(",") 
	end
end
