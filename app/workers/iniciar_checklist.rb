class IniciarChecklist
include Sidekiq::Worker
  sidekiq_options queue: "Gestao"
  
  def perform(id)
  	# id = 54
  	puts "IniciarChecklist: procurando pelo ExecChecklist(#{id})..."
  	cl = ExecChecklist.find(id)
  	puts "Achei ExecChecklist: #{cl}"
  	sc = ServiceChecklist.new(cl)
  	sc.FinalizarCriacaoChecklist
  end

end
