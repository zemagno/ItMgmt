class ExecItensChecklist < ActiveRecord::Base
  belongs_to :exec_checklist
  belongs_to :status_checklist
  attr_accessible :cis, :descricao, :users
end
