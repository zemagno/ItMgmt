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

              
end

# Checklist.pais 0 ==> incorporado ao jira/checklista atual
# Checklist.superpai 1 ==> um jira para cada pai
# Checklist.filho ==> quem depende desse itens_checklists
# 