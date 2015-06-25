class Scheduler < ActiveRecord::Base
  attr_accessible :job, :when

  def self.go
  	hoje = Time.now().wday
  	Scheduler.all.each do |x|
  		if x.when[hoje]=="1" 
  			Producao.dispatcherJob(x.job)
  		end
 	end  	
  end
end

# Whenever 
#    Roda rake scheduler:go
# Rake scheduler:go 
#    roda Class Scheduler.go 
# Scheduler.go
#    Pesquisa no Scheduler, quais [job]s que tem para rodar naquele dia
#       Producao.dispatcher ([job])
#
# Producao.dispatcher
#     Criar um Producao (no db)
#     Enfilera no sidekiq Producao.id
#
# ProducaoWork
#     Case Job
#         executa servico equivalente ao token [job] , Ex: CargaPosicao

