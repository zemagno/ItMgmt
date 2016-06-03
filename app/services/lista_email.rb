class ListaEmail

  # def self.acerta(lista:"" , sufixo: "brq.com", blacklist:true)

  #   lista = "" if lista.nil?
  #   #lista.downcase.gsub(/\s+/, "").split(",").compact.uniq.delete_if { |c| c == "" }.collect{ |s| s+((s.include? '@' ) ? "" : sufixo)  }.join(",")
  #   # espaco adicionado pois montagem de email no outlook nao permite campo nulo na URL: &cc=&bcc=&body...tem que ser &cc=
  #   lista.downcase.gsub(/@brq.com/,"").
  #     gsub(/\s+/, "").split(",").compact.uniq.delete_if { |c| c == "" }.collect{ |s| s+((s.include? '@' ) ? "" : sufixo)  }.join(";")+" "
  # end

  # def self.blacklist(lista)
  #   blacklist = Parametro.get(:tipo => "Email", :subtipo => "Blacklist").split(",")
  #   lista.split(";").delete_if { |c| blacklist.include?(c) }.join(";")+" "
  # end

  def self.acerta(parametros) # listaEmails:"" , sufixo: "brq.com", blacklist:false)
    listaEmails = parametros[:listaEmails]
    sufixo = parametros[:sufixo]
    blacklist = parametros[:blacklist]

    listaEmails = "" if listaEmails.nil?
    #lista.downcase.gsub(/\s+/, "").split(",").compact.uniq.delete_if { |c| c == "" }.collect{ |s| s+((s.include? '@' ) ? "" : sufixo)  }.join(",")
    # espaco adicionado pois montagem de email no outlook nao permite campo nulo na URL: &cc=&bcc=&body...tem que ser &cc=
    listaEmails = listaEmails.downcase.gsub(/@brq.com/,"").
      gsub(/\s+/, "").split(",").compact.uniq.delete_if { |c| c == "" }.collect{ |s| s+((s.include? '@' ) ? "" : sufixo)  }.join(";")+" "
     if blacklist
       listaEmails = self.blacklist({listaEmails:listaEmails}) if blacklist
    end
    listaEmails
  end

  def self.blacklist(parametros)
    lista = parametros[:listaEmails]
    blacklist = Parametro.get(:tipo => "Email", :subtipo => "Blacklist").split(",")
    lista = lista.gsub(/\s+/, "").split(";").delete_if { |c| blacklist.include?(c) }.join(";")+" "
    lista
  end

end