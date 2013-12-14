class ItensChecklist < ActiveRecord::Base
  belongs_to :checklist
  attr_accessible :cis, :descricao, :users, :checklist_id
end
