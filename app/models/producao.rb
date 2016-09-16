class Producao < ActiveRecord::Base
  attr_accessible :data, :detalhe, :id, :job, :status

  default_scope order('created_at DESC')

  def self.dispatcherJob(_job)
  	j = self.create(:job => _job, :status => "Scheduled")
  	ProducaoWorker.perform_async(j.id)
  end

  def finaliza(_status, _detalhes)
    self.job = self.job.split("_").join(" ")
  	self.detalhe = _detalhes
  	self.status = _status
  	self.data = DateTime.now
  	save!
  end

  define_index do
    indexes detalhe
    indexes status
    indexes job
    indexes id
    indexes data
  end
end
