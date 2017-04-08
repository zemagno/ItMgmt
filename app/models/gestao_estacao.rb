class GestaoEstacao

  attr_accessor :hostname
  # attr_accessor :licencasemuso
  # attr_accessor :estacoes


  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value) if respond_to?(name)
    end
  end


  def CIs
    # devolve todos os CIs que tem esse hostname
    # id, status, chave, descricao, owner, notificacao, 
  end

  def Owner
    # procura o owner dessa estacao. Pode ter varios CIs se tiver hostname duplicado
    #
  end

  def Atributos
    # atributos do CI estacao (status, usuario, descricao)
  end

  def Erros 
    # erros possiveis --> 
    # (1) - mais de um CI estacao com o mesmo hostname
  end


  def HistoricoLogin
    # tem que importar dados do denis para o itmgmt
    # pesquisar nos dados do Script do Denis
  end

  def SoftwaresInstalados
    # pesquisa em todas as bases de inventario (denis, auditor, CMDB)
  end

  def Log
    # ler dos logs dos CIs.
  end


  def self.LiberaEstacao(attributes = {})
    c = Ci.find_by_chave(attributes[:estacao])
    if ! c.nil?
      c.statusci_id = 8
      c.CCDebito = ""
      c.ProjetoDebito = ""
      c.Owner = "BRQ"
      c.notificacao = ""
      c.save!
    end
  end

  def self.getAtributosAlocarEstacao
    begin
       p = JSON.parse(Parametro.get(:tipo => "Alocar",:subtipo => "Estacao2"))
    rescue
       p = JSON.parse('{ "campos": "0","tipoci_id": 0,"statusci_id": "0" }')
       p = JSON.parse('{ "campos": "316,317,318, 329,328,394, 320,321,322,393","tipoci_id": 46,"statusci_id": "8" }')
    end
    tipoci_id = p["tipoci_id"] || 0
    status_possiveis = p["statusci_id"].split(",").map(&:to_i)
    return p["campos"].split(",").map(&:to_i), tipoci_id, status_possiveis
  end

  def self.Atributos
    c = Ci.new
    _attr,_tipoci_id,_status_possiveis = GestaoEstacao.getAtributosAlocarEstacao
    c.tipoci_id=_tipoci_id
    atributos = c.atributos
    atributos.delete_if { |k,v| !  _attr.include?(k) }
    atributos
  end


todo ==> fazer testes unitarios com atributos, getAtributosAlocarEstacao e AlocarEstacao
 fazer teste com versao anterior, e com essa versao...


  def self.AlocarEstacao(attributes = {})

    estacao_disponivel = Ci.find_by_chave(attributes[:estacao])
    _attr,_tipoci_id,_status_possiveis = GestaoEstacao.getAtributosAlocarEstacao

    if estacao_disponivel and estacao_disponivel.tipoci_id==_tipoci_id and _status_possiveis.include?(estacao_disponivel.statusci_id)

      estacao_disponivel.Owner = attributes[:gestor]
      estacao_disponivel.notificacao = attributes[:id]
      estacao_disponivel.CCDebito = attributes[:cc]
      estacao_disponivel.ProjetoDebito = attributes[:projeto]
      estacao_disponivel.statusci_id = 1
      attr_original = estacao_disponivel.atributos
      estacao_disponivel.save!
      attr = {}
      attr_original.map {|k,v| attr[v[0]] = v[1] }
      attr = attr.merge(attributes[:atributos])
      estacao_disponivel.atributos = attr
    else
      estacao_disponivel = nil
    end
    estacao_disponivel
  end



end
