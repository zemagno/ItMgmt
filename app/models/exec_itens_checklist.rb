class ExecItensChecklist < ActiveRecord::Base
  belongs_to :exechecklist
  belongs_to :statuschecklist
  attr_accessible :cis, :descricao, :gmud, :users
end
