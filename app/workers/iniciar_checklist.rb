class IniciarChecklist
include Sidekiq::Worker
  sidekiq_options queue: "Gestao"
  
  def perform(id)
  	# id = 7
  	cl = ExecChecklist.find(id)
  	sc = ServiceChecklist.new(cl)
  	sc.FinalizarCriacaoChecklist
  end

end
