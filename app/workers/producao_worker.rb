class ProducaoWorker
  include Sidekiq::Worker
  sidekiq_options queue: "Gestao" , :retry => 4, :backtrace => true
  #sidekiq_options retry: false
  

  def perform(id)
    job = Producao.find(id)
    status = "Erro"
    detalhes = "Job Unknow"

    # if job.job == "CargaPosicao"  
    #       status,detalhes = ServiceCargaPosicao.new.go
    # end
    # if job.job == "CargaUra"  
    #       status,detalhes = ServiceCargaUra.new.go
    # end
    # if job.job == "CargaRM"  
    #   puts "vou rodar dinamento CargaRM"
    #       status,detalhes = ServiceCargaRm.new.go
    # end
    puts "Producao..."

    if job.job =~ /^Carga_([a-zA-Z]+)$/
       status,detalhes = Object::const_get("ServiceCarga#{$1}").new().go
    end

    if job.job =~ /^Mailing_([a-zA-Z]+)$/
       puts "vou enviar [#{$1}]"
       status,detalhes = Object::const_get("ServiceMailing").new().go($1)
    end

    if job.job =~ /^Query_([a-zA-Z]+)$/
      status,detalhes = ServiceQueries.new.go($1)
    end
    puts "---------"
    puts status
    puts detalhes
    puts "---------"
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