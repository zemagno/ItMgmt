class Producao < ActiveRecord::Base
  attr_accessible :data, :detalhe, :id, :job, :status

  def self.dispatcherJob(_job)
  	j = self.create(:job => _job, :status => "Scheduled")
  	ProducaoWorker.perform_async(j.id)
  end

  def finaliza(_status, _detalhes)
  	self.detalhe = _detalhes
  	self.status = _status
  	self.data = DateTime.now
  	save!
  end
end
