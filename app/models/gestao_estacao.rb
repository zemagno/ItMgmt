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

  def self.Atributos
    c = Ci.new
    c.tipoci_id=46
    atributos = c.atributos
    p = Parametro.get(:tipo => "Alocar",:subtipo => "Estacao")
    fields = p.split(",").map(&:to_i)
    atributos.delete_if { |k,v| ! fields.include?(k) }
    atributos
  end



  def self.AlocarEstacao(attributes = {})

    estacao_disponivel = Ci.find_by_chave(attributes[:estacao])
    if estacao_disponivel and estacao_disponivel.tipoci_id==46 and estacao_disponivel.statusci_id == 8

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
