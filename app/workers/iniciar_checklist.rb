class IniciarChecklist
include Sidekiq::Worker
  sidekiq_options queue: "Gestao_temp"
  
  def perform(id)
  	cl = ExecChecklist.find(id)
  	sc = ServiceChecklist.new(cl)
  	sc.FinalizarCriacaoChecklist
  end

end
