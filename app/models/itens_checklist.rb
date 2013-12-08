class ItensChecklist < ActiveRecord::Base
  belongs_to :Checklist
  belongs_to :user
  belongs_to :ci
  attr_accessible :descricao
end
