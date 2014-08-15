def atributos_to_docs(attr,_url)
	@docs = ""
	return if attr.blank?
	attr.split(",").each do |j|
		url = j.split("|")
		url[1] = url[0] if url[1].blank?
        @docs += "#{url[0]}|#{_url}#{url[1]},"
	end
	@docs
end