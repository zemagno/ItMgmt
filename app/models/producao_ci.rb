class ProducaoCi < ActiveRecord::Base
  attr_accessible :ci_id, :date, :detalhe, :job, :status
end
