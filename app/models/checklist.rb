  class Checklist < ActiveRecord::Base
  belongs_to :tipoci
  has_many :itens_checklists
  belongs_to :tipo_checklist
  belongs_to :area_responsabilidade
  attr_accessible :descricao, :users, :tipoci_id, :area_responsabilidade_id, :alias, :abrir_ticket

  after_initialize :init

  def init
    self.abrir_ticket = true if self.abrir_ticket.nil?
  end

  has_many  :relacao_filho, 
            :class_name => "HerancaChecklist",  
            :foreign_key => "pai_id", 
            :dependent => :delete_all

  has_many  :filhos, 
            :through => :relacao_filho


  has_many  :relacao_pai, 
            :class_name => "HerancaChecklist", 
            :foreign_key => "filho_id",  
            :dependent => :delete_all,
            :conditions => "tipo_heranca = 0"
  

  has_many  :relacao_superpai, 
            :class_name => "HerancaChecklist", 
            :foreign_key => "filho_id",  
            :dependent => :delete_all,
            :conditions => "tipo_heranca = 1"

  has_many  :pais, 
            :through => :relacao_pai

  has_many  :superpais, 
            :through => :relacao_superpai

  def tipoci_tipo
    tipoci.nil? ? "" : tipoci.tipo
  end

  def arearesponsabilidade
     (area_responsabilidade.area if ! area_responsabilidade.blank?) || ""
  end
  def arearesponsabilidade_full
     ("#{area_responsabilidade.area} - #{area_responsabilidade.responsaveis}" if ! area_responsabilidade.blank?) || "Indef."
  end
  def responsaveis
    (area_responsabilidade.responsaveis if ! area_responsabilidade.blank?) || ""
  end
  def responsavel
    responsaveis.split(",").first || ""
  end
              
end

# Checklist.pais 0 ==> incorporado ao jira/checklista atual
# Checklist.superpai 1 ==> um jira para cada pai
# Checklist.filho ==> quem depende desse itens_checklists
# 