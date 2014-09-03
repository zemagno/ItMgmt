class HerancaChecklist < ActiveRecord::Base
  attr_accessible :filho_id, :pai_id

  belongs_to :pai, :class_name => "Checklist"
  belongs_to :filho, :class_name => "Checklist"
  belongs_to :superpais, :class_name => "Checklist",  :foreign_key => "pai_id"
  
  before_save :default_values
  def default_values
    self.tipo_heranca ||= 0
  end

end
