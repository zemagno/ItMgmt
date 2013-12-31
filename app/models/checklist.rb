class Checklist < ActiveRecord::Base
  belongs_to :tipoci
  has_many :itens_checklists
  belongs_to :tipo_checklist
  attr_accessible :descricao, :users, :tipoci_id

  has_many  :relacao_filho, 
            :class_name => "HerancaChecklist",  
            :foreign_key => "pai_id", 
            :dependent => :delete_all

  has_many  :filhos, 
            :through => :relacao_filho


  has_many  :relacao_pai, 
            :class_name => "HerancaChecklist", 
            :foreign_key => "filho_id",  
            :dependent => :delete_all
  
  has_many  :pais, 
            :through => :relacao_pai



  def tipoci_tipo
    tipoci.nil? ? "" : tipoci.tipo
  end

  def self.IniciarChecklist(id, cis = '' ,inicio = nil ,fim = nil)
    # iniciar um exec_checklist copiando todos os atributos
    # abrir jira e atualizar campo gmud
    # se foi aberto de dentro de uma CI, preencher o campo CI
    # navegar por todos os pais, copiando os itens, compactando e gerando exec_itens_checklist
    # notificar quem pediu para iniciar ou responsavel(se foi automatico)
    checklist = Checklist.find(id)
    exec_checklist = ExecChecklist.new
    exec_checklist.descricao = checklist.descricao
    exec_checklist.users = checklist.users
    exec_checklist.cis = cis
    exec_checklist.inicioexec = inicio
    exec_checklist.fimexec = fim
    exec_checklist.save
    exec_checklist
  end
            
end
