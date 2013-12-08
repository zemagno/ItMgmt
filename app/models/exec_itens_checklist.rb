class ExecItensChecklist < ActiveRecord::Base
  belongs_to :ci
  belongs_to :ExecChecklist
  belongs_to :StatusChecklist
  attr_accessible :descricao, :gmud, :user
end
