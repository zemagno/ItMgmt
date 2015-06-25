class ProducaoWorker
  include Sidekiq::Worker
  sidekiq_options queue: "Gestao" , :retry => 4, :backtrace => true
  #sidekiq_options retry: false
  

  def perform(id)
    job = Producao.find(id)
    status = "Erro"
    detalhes = "Job Unknow"

    if job.job == "CargaPosicao"  
          status,detalhes = ServiceCargaPosicao.new.go
    end
    
    if job.job =~ /^Query_([a-zA-Z]+)$/
      status,detalhes = ServiceQueries.new.go($1)
    end
    job.finaliza(status, detalhes)
  end
end

#
#  query (CI, Tag, PadraoEmail...... )
#  gera ProducaoCi(Ci, tag)
#
#
#
#
#
#
#
#
#