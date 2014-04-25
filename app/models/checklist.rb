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

              
end
