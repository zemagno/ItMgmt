class ListaEmail

  def self.acerta(parametros) 
    listaEmails = parametros[:listaEmails]
    sufixo = parametros[:sufixo]
    blacklist = parametros[:blacklist]

    listaEmails = "" if listaEmails.nil?
    # espaco adicionado pois montagem de email no outlook nao permite campo nulo na URL: &cc=&bcc=&body...tem que ser &cc=
    listaEmails = listaEmails.downcase.gsub(CONFIG["mail"]["domain"],"").
      gsub(/\s+/, "").split(",").compact.uniq.delete_if { |c| c == "" }.collect{ |s| s+((s.include? '@' ) ? "" : sufixo)  }.join(CONFIG["mail"]["separator"])+" "
     if blacklist
       listaEmails = self.blacklist({listaEmails:listaEmails}) if blacklist
    end
    listaEmails
  end

  def self.blacklist(parametros)
    lista = parametros[:listaEmails]
    blacklist = Parametro.get(:tipo => "Email", :subtipo => "Blacklist").split(",")
    lista = lista.gsub(/\s+/, "").split(CONFIG["mail"]["separator"]).delete_if { |c| blacklist.include?(c) }.join(CONFIG["mail"]["separator"])+" "
    lista
  end

end