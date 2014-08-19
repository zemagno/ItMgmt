module ApplicationHelper

# TODO Limpar esse metodo..
#def acerta_lista_email(lista,sufixo)
#    lista.gsub(/\s+/, "").split(",").compact.uniq.delete_if { |c| c == "" }.collect{ |s| s+sufixo  }.join(",")      
#end  

# TODO isso pode virar uma classe, como a ListaEmail dentro do services ?
def docs_to_url(doc)
	@URLs = []
	    if doc != nil then 
	        doc.split(',').each do |d|
            	tupla = []
	      	   		d.split('|').each do |i|
                  		tupla << i
            		end
            	@URLs << tupla
          	end
	    end	  
	@URLs
end


def jira_to_docs(jira)
	@docs = ""
	return if jira.blank?
	jira.split(",").each do |j|
		url = j.split("|")
		url[1] = url[0] if url[1].blank?
		
		if url[1].include? "INFRA-"
                   url[1] = "http://jiracorp.brq.com/browse/#{url[1]}"
        elsif url[1].include? "INFR-"
                   url[1] = "http://jira.brq.com/browse/#{url[1]}"
        end
        @docs += "#{url[0]}|#{url[1]},"
	end
	@docs
end

def atributos_to_docs(attr,_url)
	@docs = ""
	return if attr.blank?
	attr.split(",").each do |j|
		url = j.split("|")
		url[1] = url[0] if url[1].blank?
        @docs += "#{url[0]}|#{_url}" % "#{url[1]},"
	end
	@docs
end

end
