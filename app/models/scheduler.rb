class Scheduler < ActiveRecord::Base
  attr_accessible :job, :when, :ordem

  default_scope { order('ordem ASC') }

  def self.go
  	hoje = Time.now()
  	Scheduler.all.each do |x|
  		# if x.when[hoje]=="1" 
  		# 	Producao.dispatcherJob(x.job)
  		# end
  		if (((x.when.include? "[#{hoje.day}]") ||  (x.when.include? ["[dom]","[seg]","[ter]","[qua]","[qui]","[sex]","[sab]"][hoje.wday])) and x.when.include? "[H#{hoje.hour}]")
        puts x.job
  		 	Producao.dispatcherJob(x.job)
  		 end
 	end  	
  end
end

# "[seg],[ter],[qua],[sex],[17],[18]"
# 
# x.include? "[#{a.day}]"
# x.downcase.include? ["dom","seg","ter","qua","qui","sex","sab"][a.wday]

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

