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

  def ramal_to_sip(ramal)
    doc = " "
    ramal = "" if ramal.nil?

    ramal.scan(/\d{6}/).each do |sip|
      doc << "<a href=\"sip:#{sip}\">#{sip}</a> "
      # doc << link_to (sip, "sip:#{sip}")
    end
    ramal.scan(/(\w+ \(\d?(\d\d)\).?\d\d\d\d.?(\d\d\d\d))/).each do |sip|
      doc << "<a href=\"sip:#{sip[1]}#{sip[2]}\">#{sip[0]}</a> / "
      # doc << link_to (sip, "sip:#{sip}")
    end
    doc
  end


  def tela_ajuda_geral
    url = Parametro.get(:tipo => "GLOBAL", :subtipo => "wikiUrl")
    txt_help = "Ajuda Geral"
    link_to txt_help , "#{url}", :target => "_blank" 
  end

  def tela_ajuda(id = nil) #(content, options = {}, html_options = {}, *parameters_for_method_reference)
  	id_help = nil

    url = Parametro.get(:tipo => "GLOBAL", :subtipo => "wikiUrl")

    case request.fullpath
    when "/cis"
      id_help = "CIs"   

    when /^\/cadrelatorios/
      id_help = "Relatorios"
    when /^\/parametros/
      id_help = "Parametros"
    when /^\/GestaoUsuarios/
      id_help = "Gestao Usuarios"
    when /^\/identities/
      id_help = "Identidades"
    when /^\/painel_producao/
      id_help = "Producao"
    when /^\/schedulers/
      id_help = id
      txt_help = "Ajuda"  
    when /^\/templates_emails/
      id_help = "Templates de Email"
    end  
    txt_help = "Ajuda #{id_help}" if txt_help.nil?

    if ! @ci.nil? && ! @ci.tipoci.nil?
  	     id_help = "CI #{@ci.tipoci.tipo}" 
         txt_help = "Ajuda #{@ci.tipoci.tipo}" 
         
    end
   
    link_to txt_help , "#{url}/#{id_help.tr(" ", "_")}", :target => "_blank" if ! id_help.nil?


  end


  def jira_to_docs(jira)
    @docs = ""
    return if jira.blank?
    jira.split(",").each do |j|
      url = j.split("|")
      url[1] = url[0] if url[1].blank?

      if url[1].include? "INFRA"
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



  def tooltip(content, options = {}, html_options = {}, *parameters_for_method_reference)
    html_options[:title] = options[:tooltip]
    html_options[:class] = html_options[:class] || 'tooltip'
    content_tag("span", content, html_options, false)
  end

end
