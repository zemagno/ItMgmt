class AuditSw < ActiveRecord::Base
  attr_accessible :cmdb, :kpmg, :sccm, :score, :software, :userid
end
