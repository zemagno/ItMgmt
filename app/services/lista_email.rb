class ListaEmail

	def self.acerta(lista, sufixo)
		lista.downcase.gsub(/\s+/, "").split(",").compact.uniq.delete_if { |c| c == "" }.collect{ |s| s+((s.include? '@' ) ? "" : sufixo)  }.join(",") 
	end
end
