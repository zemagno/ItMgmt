class ListaEmail

	def self.acerta(lista, sufixo)
		lista = "" if lista.nil?
		#lista.downcase.gsub(/\s+/, "").split(",").compact.uniq.delete_if { |c| c == "" }.collect{ |s| s+((s.include? '@' ) ? "" : sufixo)  }.join(",") 
		# espaco adicionado pois montagem de email no outlook nao permite campo nulo na URL: &cc=&bcc=&body...tem que ser &cc= 
		lista.downcase.gsub(/@brq.com/,"").gsub(/\s+/, "").split(",").compact.uniq.delete_if { |c| c == "" }.collect{ |s| s+((s.include? '@' ) ? "" : sufixo)  }.join(";")+" " 
	end
end
