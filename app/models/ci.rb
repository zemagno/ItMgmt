# Encoding: utf-8
require "jiraable"
require "statusable"
class Ci < ActiveRecord::Base
  audited
  self.per_page = 20

  #has_associated_audits

  # has_paper_trail
  include Jiraable
  include Statusable # inserir o metodo .status e .status_icon

  attr_accessible :chave, :Owner, :notificacao, :descricao, :dataChange, :DocChange, :site_id, :tipoci_id, :url, :jira, :tipoCobranca, :statusci_id, :CustoMensal, :CCDebito, :ProjetoDebito, :CCCredito, :ProjetoCredito, :cobrar, :descricaocobranca, :codigocobranca, :provisionar, :CustoMensalOpex, :CustoMensalCapex, :oldStatusci_id



  belongs_to :site
  belongs_to :tipoci
  belongs_to :statusci
  has_many :atributo, :dependent => :destroy #, touch: true  #destroy ==> instancio e chamo o destroy do atributo
  has_many :task
  has_many :log_ci
  after_touch :clear_association_cache



  # nos relacionamento, vou chamar delete_all para so apagar da tabela de relacionamento...
  has_many :relacao_dependencia, -> { where 'tipo=0'},
    :class_name => "Relacionamento",
    :foreign_key => "impactado_id",
    :dependent => :delete_all

  has_many :dependentes,
    :through => :relacao_dependencia
  # :include => "tipoci"

  has_many :relacao_composto_de, -> { where 'tipo=1'},
    :class_name => "Relacionamento",
    :foreign_key => "impactado_id",
    :dependent => :delete_all

  has_many :composto_de,
    :through => :relacao_composto_de
  # :include => "tipoci"

  has_many :relacao_dependencia_all,
    :class_name => "Relacionamento",
    :foreign_key => "impactado_id",
    :dependent => :delete_all

  has_many :dependentes_all,
    :through => :relacao_dependencia_all
  # :include => "tipoci"

  has_many :relacao_impacto,
    :class_name => "Relacionamento",
    :foreign_key => "dependente_id",
    :dependent => :delete_all

  has_many :impactados,
    :through => :relacao_impacto
  # :include => "tipoci"

  validates :Owner, :format => {:with => /\A[a-zA-z.]+\z/,                 message: I18n.t("errors.ci.Owner.format")}
  validates :chave, :presence =>  {                                      message: I18n.t("errors.ci.chave.presence")}
  validates :chave, :uniqueness => {:case_sensitive => false,            message: I18n.t("errors.ci.chave.uniqueness")}
  validates :chave, format: { with: /\A[a-zA-Z0-9\_\-\<\>\.\/]+\z/,        message: I18n.t("errors.ci.chave.format") }
  validates :descricao, :presence => {                                   message: I18n.t("errors.ci.descricao.presence")}

  # validates :Owner, :format => {:with => /^[a-zA-z.]+$/,                 message: "Gestor tem que ser um ID de rede (somente caracteres)"}
  # validates :chave, :presence =>                                         message: "Chave é mandatorio"}
  # validates :chave, :uniqueness => {:case_sensitive => false,            message: "Ja existe um ativo com a mesma chave"}
  # validates :chave, format: { with: /^[a-zA-Z0-9\_\-\<\>\.\/]+$/,        message: "Chave deve conter somente caracteres alphanumericos" }
  # validates :descricao, :presence => {:message => "Descrição é mandatoria"}

  after_save :atualiza_chave, ThinkingSphinx::RealTime.callback_for(:ci)
  before_save :atualiza_statusci
  after_create :post_create_processing
  after_destroy :post_destroy_processing
  # after_save

  scope :por_tipo, lambda { |t| where("tipoci_id in (?)", t) }
  default_scope { order('chave ASC') }



  def to_s
    "Chave:#{chave} : #{descricao} : Tipo: #{nice_tipoci} : Status:#{status} : Owner:#{self.Owner} : Usuario: #{notificacao} : Site: #{self.nome_localidade}"
  end

  def to_hash
    {"chave" => chave, "descricao" => descricao, "tipoci" => nice_tipoci, "Owner" => self.Owner, "id" => id, "status" => status.upcase, "dataChange" => self.dataChange}
  end

  def chave_sanitizada
    chave.gsub(/\ /, "_").delete('^a-zA-Z0-9\_')
  end

  def ativo?
    (statusci_id != 2) and (statusci_id != 5)
  end

  def tipo_ci
    tipoci.tipo
  end

  def nice_tipoci
    tipoci.nil? ? "" : tipoci.tipo
  end

  def nice_status
    statusci.nil? ? "" : statusci.status
  end


  def data_ultima_alteracao
    dataChange.blank? ? dataChange : ""
  end

  def nome_localidade
    site.nil? ? "" : site.nome
  end

  def nome_estado
    site.nil? ? "" : site.estado
  end

  def nice_atributos
    atributo.collect(&:valor).join(' ')
  end

  def nice_custo_mensal
    '%10.2f' % (self.CustoMensal.nil? ? 0 : self.CustoMensal)
  end


  def self.tipoCobrancas
    [["Nao Cobrar", 0], ["Cobrar do Projeto", 1], ["Cobrar do Usuario", 2]]
  end


  def nice_cobrar
    case tipoCobranca
    when 0
      "Nao Cobrar"
    when 1
      "Cobrar do Projeto (#{self.descricaocobranca}/#{self.codigocobranca})"
    when 2
      "Cobrar do Usuario"
    else
      "Nao Cobrar"
    end
  end

  def nice_provisionar
    provisionar ? "Provisionar" : "Nao Provisionar"
  end

  def self.massiveUpdate(_search, _command)

    cis = search _search, :match_mode => :boolean
    cmd_expandido = _command.split(",").map { |x| x.split("=") }

    cis.each do |x|
      cmd_expandido.each { |k, v| x.send("#{k}=", v) if x.respond_to?(k) }
      x.save!
    end
  end


  def duplicar(nova_chave)
    newci = deep_clone :include => :atributo
    newci.chave = nova_chave
    newci.save
    newci
  end

  # retorno o valor dos atributos a partir de Ci._<apelido_atributo>
  def method_missing(method_sym, *arguments, &block)
    if method_sym.to_s =~ /^_([a-zA-Z]+)$/
      return getatributo($1)
    elsif method_sym.to_s =~ /^_([a-zA-Z]+)=$/
      setatributo($1, *arguments)
    else
      super
    end
  end

  def respond_to?(method_sym, include_private = false)
    if method_sym.to_s =~ /^_([a-zA-Z]+)=?$/
      true
    else
      super
    end
  end


  def getatributo(chave)
    attr = atributos.select { |k, v| v[5] == chave }
    return attr.values[0][1] if attr.size > 0 && !attr.values[0][1].nil?
    return ""
  end

  # TODO colocar todo servicos de atributos numa services. Nao deixar no model do CI.
  # TODO --> isso aqui é lento...tem que colocar num variavel e se chamar de novo, retorna tud
  # TODO --> testar se eu chamo varias vezes, ele monta sempre, sempre..
  #

  def atributos2
    return @attr_existentes2 unless @attr_existentes2.blank?

    @attr_existentes2 = []

    tipoci.dicdados.map { |x| @attr_existentes2 << [x.id,x.nome, nil, x.url, x.valores, x.descricao, x.apelido, x.tipo, x.regex, x.mandatorio, x.tooltip,x.tab.nil? ? "Caracteristicas" : x.tab, x.bloqueado] }

    atributo.map do |x|
      idx = @attr_existentes2.index { |elem| elem[0]==x.dicdado.id}
      @attr_existentes2[idx][2] = x.valor if idx
    end

    @attr_existentes2

  end

  def atributos

    # pegar todos os atributos possiveis (tipoci.dicdado)
    # dicdados.id => [Label,valor]
    #{ 5=>["Contrat", "Link Citi"],
    #  3=>["Designacao", "001a-98/97"],
    #  2=>["Endereco", "Av Boa Vista"],
    #  1=>["Capacidade", "4mb"]}
    Rails.logger.debug "[DEBUG] Ci.atributos: lendo atributos do db e montando hash"

    return @attr_existentes unless @attr_existentes.blank?
    
    Rails.logger.debug "[DEBUG] Ci.atributos:  Nao estava no cache. Vou ler realmente do DB"

    @attr_existentes = Hash.new

    # monto um hash com todos atributos/dicdados que esse CI deve ter
    tipoci.dicdados.map { |x| @attr_existentes[x.id] = [x.nome, nil, x.url, x.valores, x.descricao, x.apelido, x.tipo, x.regex, x.mandatorio, x.tooltip,x.tab, x.bloqueado] }

    # populo o @attr_existentes com os valores dos atributos EXISTENTE na base de dados
    atributo.includes(:dicdado).map do |x|
      
      # se CI mudou de tipo, podera ter algum atributo q nao foi carregdo a partir do tipoci.dicdado
      # entao eu crio esse atributo no hash
      #
      # TODO --> ERRO: isso podera ser inutil. Se mudou de tipo, para que carregar a partir da tabela atributos ??? nao vou usar mais esse campo mesmo...
      #          ERRO: na verdade estou carregando so para poder atribuir o valor (logo depois do IF)
      #
      if !@attr_existentes[x.dicdado.id] then
        @attr_existentes[x.dicdado.id] = [x.dicdado.nome, nil, x.dicdado.url, x.dicdado.valores, x.dicdado.descricao, x.dicdado.apelido, x.dicdado.tipo, x.dicdado.regex, x.dicdado.mandatorio, x.dicdado.tooltip,x.dicdado.tab,x.dicdado.bloqueado]
      end
      @attr_existentes[x.dicdado.id][1] = x.valor
    end

    @attr_existentes
  end

  def limpa_atributos_outros_tipo
    Rails.logger.debug "[DEBUG] Ci.limpa_atributos_outros_tipo: id:[#{self.id}]:#{self.chave} tipoci_id:[#{tipoci_id}]"
    atributo.includes(:dicdado).each do |attr|
      if attr.dicdado.tipoci_id != tipoci_id
        Rails.logger.debug "[DEBUG]     apagando atributo:[#{attr.dicdado_id}]"
        attr.delete
        attr.save
      end
    end

    # FIXME atributos ainda esta apontando para atributos antigos...como limpar cache

  end

  def setatributo(key, value)
    k = atributos.select { |k, v| v[5] == key }
    if !k.blank?
      # a = Atributo.find_or_create_by_ci_id_and_dicdado_id(id, k.keys[0])
      a = Atributo.find_or_create_by(ci_id: id, dicdado_id: k.keys[0])
      a.valor=value
      a.save!
    end
    # TODO fazer um set atributo com um valor, para poder
  end


  def atributos=(novos_atributos = {})
    # Descriptions.find_or_create_by_my_id(data["my_id"]).update_attributes(data)
    # Atributo (ci_id, dicdado_id, valor)
    # c.atributo[1].dicdado.nome =  "Contrat"
    # atributos : dicdados.id => [Label do dicdados,valor]
    #{ 5=>["Contrat", "Link Citi"],
    #  3=>["Designacao", "001a-98/97"],
    #  2=>["Endereco", "Av Boa Vista"],
    #  1=>["Capacidade", "4mb"]}
    Rails.logger.debug "[DEBUG] - Vou iniciar atualizacaos dos atributos #{nice_atributos}"

    attr_default = atributos

    Rails.logger.debug "[DEBUG] - Li Atributos"


    attr_default.each do |attr|

      # atr = Atributo.find_or_create_by_ci_id_and_dicdado_id(id, attr[0])
      atr = Atributo.find_or_create_by(ci_id: id , dicdado_id: attr[0])

      begin #posso nao ter recebido parametro nenhum
        if atr.valor != novos_atributos[attr[1][0]]
          atr.valor = novos_atributos[attr[1][0]]
          atr.save
          Rails.logger.debug "DEBUG[I00200] - apos salver um atributo [#{novos_atributos[attr[1][0]]}] #{id} - #{chave}"
        end
      rescue
        # TODO Log
      end
    end

    limpa_atributos_outros_tipo
    Rails.logger.debug "[DEBUG] - Finalizei atualizacaos dos atributos #{nice_atributos}"
    # ThinkingSphinx::RealTime.callback_for(:ci,[:ci])

  end

  def anterior
    Ci.where("id < ?", id).last
  end

  def proximo
    Ci.where("id > ?", id).first
  end

  def self.find_gen(param)
    begin
      if param =~ /^[1-9]\d*$/
        Ci.includes(:atributo => :dicdado).find(param)
      else
        Ci.includes(:atributo => :dicdado).find_by_chave(param)
      end
    rescue ActiveRecord::RecordNotFound
      Ci.includes(:atributo => :dicdado).find_by_chave(param)
    end
  end

  def self.find_com_atributos(id)
    @c = Ci.find_gen(id)
    attr = (@c ? @c.atributos : nil)
    [@c, attr]
  end


  private
  def atualiza_chave
    # puts "______________________________________________________________"
    # puts "pos save #{self.chave} #{self.statusci_id} #{self.statusci_id_changed?} #{self.statusci_id_was}"
    # puts "_______________________________________________________________"
    nova_chave = self.chave.gsub "<ID>", id.to_s
    self.update_attributes(:chave => nova_chave) if self.chave != nova_chave
  end

  def atualiza_statusci
    puts "_______________________________________________________________"
    puts "before save: atualiza_statusci [#{self.statusci_id_was}] -> [#{self.statusci_id}]"
    puts "_______________________________________________________________"
    self.oldStatusci_id = self.statusci_id_was if self.statusci_id_changed?
    BreEvent.register(:mudar_status,self,self.statusci_id_was) if self.statusci_id_changed?
  end

  def post_create_processing
    # puts "_______________________________________________________________"
    # puts "pos save #{self.chave} #{self.statusci_id}"
    # puts "_______________________________________________________________"
    
    # BRE SUSPENSO BreEvent.register(:criar,self)

  end

  def post_destroy_processing
    # puts "_______________________________________________________________"
    # puts "pos destroy #{self.chave} #{self.statusci_id}"
    # puts "_______________________________________________________________"
    # BRE SUSPENSO BreEvent.register(:eliminar,self)

  end

end

# http://freelancing-god.github.com/ts/en/installing_sphinx.html
# select * from sites
