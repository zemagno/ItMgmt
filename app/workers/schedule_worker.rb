class ScheduleWorker
  include Sidekiq::Worker
  sidekiq_options queue: "Gestao", :retry => 2, :backtrace => true
  #sidekiq_options retry: false
  
  def perform(job_id)
    Event.register("schedule","inicio","detalhe","Inicio do schedule diario")
    #job = JobEnviarEmail.find(job_id) # busco o job no BD
    Event.register("schedule","fim","detalhe","Inicio do schedule diario")
  end

  def go
    Event.register("schedule","inicio","detalhe","Inicio do schedule diario")
  end
end
