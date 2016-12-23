class Producao < ActiveRecord::Base
  include ThinkingSphinx::Scopes
  attr_accessible :data, :detalhe, :id, :job, :status

  default_scope { order('id DESC') }
  # sphinx_scope(:latest_first) {
  #   {:order => 'data DESC'}
  # }
  after_save ThinkingSphinx::RealTime.callback_for(:producao)

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


end
