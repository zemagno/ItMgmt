module ApplicationHelper

def acerta_lista_email(lista,sufixo)
    lista.gsub(/\s+/, "").split(",").compact.uniq.delete_if { |c| c == "" }.collect{ |s| s+sufixo  }.join(",")      
end  
end
