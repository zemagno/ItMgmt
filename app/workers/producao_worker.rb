class ProducaoWorker
  include Sidekiq::Worker
  sidekiq_options queue: "Producao" , :retry => 4, :backtrace => true
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
   

    if job.job =~ /^CargaGenerica_([a-zA-Z0-9]+)$/
       status,detalhes = ServiceCargaGenerico.new().go("#{$1}")
    end

    if job.job =~ /^Carga_([a-zA-Z0-9]+)$/
       status,detalhes = Object::const_get("ServiceCarga#{$1}").new().go
    end

    if job.job =~ /^Acerta_([a-zA-Z0-9]+)$/
       status,detalhes = Object::const_get("ServiceAcerta#{$1}").new().go
    end

    if job.job =~ /^Mailing_([a-zA-Z0-9]+)$/
       puts "vou enviar [#{$1}]"
       status,detalhes = Object::const_get("ServiceMailing").new().go($1)
    end

    if job.job =~ /^Producao_([a-zA-Z0-9]+)$/
       status,detalhes = Object::const_get("ServiceProducao#{$1}").new().go()
    end

    if job.job =~ /^Query_([a-zA-Z0-9]+)$/
      status,detalhes = ServiceQueries.new.go($1)
    end



    if job.job =~ /^Dashboard_([a-zA-Z0-9]+)$/
      status,detalhes = ServiceAlerta.new.go($1)
    end

    puts "---------"
    puts status
    puts detalhes
    puts "---------"
    job.finaliza(status, detalhes)
  end
end
