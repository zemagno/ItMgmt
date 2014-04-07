class HerancaChecklist < ActiveRecord::Base
  attr_accessible :filho_id, :pai_id

  belongs_to :pai, :class_name => "Checklist"
  belongs_to :filho, :class_name => "Checklist"
  
end
