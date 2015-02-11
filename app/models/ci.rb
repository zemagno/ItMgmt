require "jiraable"
require "statusable"
class Ci < ActiveRecord::Base
  audited
  self.per_page = 20

  #has_associated_audits

  # has_paper_trail
  include Jiraable
  include Statusable # inserir o metodo .status e .status_icon

  attr_accessible :chave, :Owner, :notificacao, :descricao, :dataChange, :DocChange, :site_id, :tipoci_id, :url, :jira, :statusci_id, :contrato_id, :CustoMensal, :CCDebito, :ProjetoDebito, :CCCredito, :ProjetoCredito, :cobrar, :descricaocobranca, :codigocobranca ,:provisionar, :codigorateio, :CustoMensalOpex, :CustoMensalCapex

  belongs_to :site
  belongs_to :tipoci
  belongs_to :statusci
  belongs_to :contrato
  has_many :atributo, :dependent => :destroy #destroy ==> instancio e chamo o destroy do atributo
  has_many :task
 
  
  # nos relacionamento, vou chamar delete_all para so apagar da tabela de relacionamento...
  has_many  :relacao_dependencia, 
            :class_name => "Relacionamento",  
            :foreign_key => "impactado_id", 
            :dependent => :delete_all, 
            :conditions => "tipo = 0"

  has_many  :dependentes, 
            :through => :relacao_dependencia, 
            :include => "tipoci"

  has_many  :relacao_composto_de, 
            :class_name => "Relacionamento",  
            :foreign_key => "impactado_id", 
            :dependent => :delete_all, 
            :conditions => "tipo = 1"

  has_many  :composto_de, 
            :through => :relacao_composto_de, 
            :include => "tipoci"
  
  has_many :relacao_dependencia_all, 
           :class_name => "Relacionamento", 
           :foreign_key => "impactado_id", 
           :dependent => :delete_all
  
  has_many  :dependentes_all, 
            :through => :relacao_dependencia_all,
            :include => "tipoci"
  
  has_many  :relacao_impacto, 
            :class_name => "Relacionamento", 
            :foreign_key => "dependente_id",  
            :dependent => :delete_all
  
  has_many  :impactados, 
            :through => :relacao_impacto,
            :include => "tipoci"

  validates :Owner, :format => { :with => /^[a-zA-z.]+$/,
      :message => "Gestor: um unico ID de rede" }
  #validates :Owner, :presence => { :message => "Gestor eh mandatorio" }
  validates :chave, :presence => { :message => " eh mandatorio" }
  validates :chave,  :uniqueness => {:case_sensitive => false, :message => " jah existe no CMDB" }
  
  validates :descricao, :presence => { :message => " eh mandatorio" }
  

  
  def to_s
      "#{id}:#{chave} : #{descricao} : #{tipoci.tipo}"  
  end

  def chave_sanitizada
    chave.gsub(/\ /,"_").delete('^a-zA-Z\_')
  end

  def ativo?
    (statusci_id != 2) and (statusci_id != 5)
  end

  def tipo_ci
    tipoci.tipo
  end

  def data_ultima_alteracao
    dataChange.blank? ? dataChange : ""
  end

  def nome_localidade
    site.nil? ? "" : site.nome
  end

  def nice_custo_mensal
     '%10.2f' % (self.CustoMensal.nil? ? 0 : self.CustoMensal)
  end

  def nice_cobrar
    cobrar ? "Cobrar" : "Nao Cobrar"
  end

  def nice_provisionar
    provisionar ? "Provisionar" : "Nao Provisionar"
  end


  def duplicar(nova_chave)
logger.debug(">>>>> duplicar")
    newci = dup :include => :atributo
    newci.chave = nova_chave
    newci.save
    newci
  end

  # retorno o valor dos atributos a partir de Ci._<apelido_atributo>
  def method_missing(method_sym, *arguments, &block)
    logger.debug(">>>>> method_missing")
    if method_sym.to_s =~ /^_([a-zA-Z]+)$/
      return getatributo($1)
    else
      super
    end
  end


  def getatributo(chave)
    logger.debug(">>>>> getatributos")
    attr = atributos.select { |k,v| v[5] == chave }
    return attr.values[0][1] if attr.size > 0
    return ""
  end
  
  # TODO colocar todo servicos de atributos numa services. Nao deixar no model do CI.
  # TODO --> isso aqui é lento...tem que colocar num variavel e se chamar de novo, retorna tud
  # TODO --> testar se eu chamo varias vezes, ele monta sempre, sempre..
  # 
  def atributos
    logger.debug(">>>>> atributos")
    # pegar todos os atributos possiveis (tipoci.dicdado)
    # dicdados.id => [Label,valor]
    #{ 5=>["Contrato", "Link Citi"], 
    #  3=>["Designacao", "001a-98/97"], 
    #  2=>["Endereco", "Av Boa Vista"], 
    #  1=>["Capacidade", "4mb"]} 
    return @attr_existentes unless @attr_existentes.blank?

    @attr_existentes = Hash.new
    
    # monto um hash com todos atributos que esse CI deve ter
    tipoci.dicdados.map {|x| @attr_existentes[x.id] = [x.nome,nil,x.url,x.valores,x.descricao,x.apelido,x.tipo,x.regex,x.mandatorio]} 
    
    # populo o hash com os valores dos atributos a partir do ci.atributo[].valor
    atributo.map do |x| 
      # se CI mudou de tipo, podera ter algum atributo q nao foi carregdo a partir do tipoci.dicdado
      # entao eu crio esse atributo no hash
     if ! @attr_existentes[x.dicdado.id] then
          @attr_existentes[x.dicdado.id] = [x.dicdado.nome,nil,x.dicdado.url,x.dicdado.valores,x.dicdado.descricao,x.dicdado.apelido,x.dicdado.tipo,x.dicdado.regex,x.dicdado.mandatorio]
      end
      @attr_existentes[x.dicdado.id][1] = x.valor 
     end 
     
    @attr_existentes
  end
  
  def limpa_atributos_outros_tipo
    logger.debug ">>>> vou limpar atributos"
    atributo.each do |attr|
      if attr.dicdado.tipoci_id != tipoci_id
        attr.delete 
        attr.save
      end
    end

    # FIXME atributos ainda esta apontando para atributos antigos...como limpar cache

  end


  def atributos=(novos_atributos = {})
    logger.debug(">>>>> atributos=")
    # Descriptions.find_or_create_by_my_id(data["my_id"]).update_attributes(data)
    # Atributo (ci_id, dicdado_id, valor)
    # c.atributo[1].dicdado.nome =  "Contrato"
    # atributos : dicdados.id => [Label do dicdados,valor]
    #{ 5=>["Contrato", "Link Citi"], 
    #  3=>["Designacao", "001a-98/97"], 
    #  2=>["Endereco", "Av Boa Vista"], 
    #  1=>["Capacidade", "4mb"]} 

    attr_default = atributos
    

    attr_default.each do |attr|
     
      atr = Atributo.find_or_create_by_ci_id_and_dicdado_id(id,attr[0])
        
        begin  #posso nao ter recebido parametro nenhum
           atr.valor = novos_atributos[attr[1][0]]
           atr.save
        rescue
          puts "deu merda...."
        end
    end

   
    limpa_atributos_outros_tipo

  end

  def anterior
    Ci.where("id < ?", id).last
  end
  
  def proximo
    Ci.where("id > ?", id).first
  end
  
  def self.find_gen(param)
    begin 
       Ci.includes(:atributo => :dicdado).find(param)
    rescue ActiveRecord::RecordNotFound
      Ci.includes(:atributo => :dicdado).find_by_chave(param)
    end
  end

  def self.find_com_atributos(id)
    logger.debug(">>>>> find_com_atributos")
    @c = Ci.find_gen(id)
    attr = (@c ? @c.atributos : nil )
    [@c, attr] 
  end



  define_index do
      indexes chave
      indexes descricao
      indexes :Owner
      indexes notificacao
      indexes :CCCredito
      indexes :ProjetoCredito
      indexes :CCDebito
      indexes :ProjetoDebito 
      indexes :descricaocobranca
      indexes :codigocobranca
      indexes :codigorateio
      indexes :provisionar
      indexes :cobrar
      indexes jira
      indexes site(:nome), :as => :localidade
      indexes statusci(:status), as => :status
      indexes tipoci(:tipo), :as => :tipo
      indexes atributo(:valor), :as => :valoratributo
      
 

      #has site_id  # se eu quiser quiser filtrar..
      #has tipoci_id
  end
  
end

# http://freelancing-god.github.com/ts/en/installing_sphinx.html
# select * from sites