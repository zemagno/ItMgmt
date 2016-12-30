class ServiceCargaAzure

  def go

      configNuvem=JSON.parse Parametro.get(:tipo => "MappingNuvem", :subtipo => "Azure")

      resultadoNuvem = JSON.parse File.read(configNuvem["file"])

      detalhe = ""
      total_replaced = 0
      total_created = 0
      total_ativos_lidos = 0
      total_ativos_encontrados = 0
      ativos_nao_achados = ""

      resultadoNuvem.each do |servidor|

    	puts "#{servidor}"
    	puts "vou procurar um servidor #{servidor[configNuvem["chave"]]}"
      ci = Ci.find_by_chave(servidor[configNuvem['chave']])
      total_ativos_lidos = total_ativos_lidos + 1
      if ci
        total_ativos_encontrados = total_ativos_encontrados + 1
        configNuvem["mapping"].each do |k,v|
          no = servidor
          v.each { |n| no = no[n]}
          
          if ci.respond_to?(k)
            ci.send("#{k}=",no) 
            total_replaced = total_replaced + 1
          end
        end
      else
        ativos_nao_achados << "[#{servidor[configNuvem['chave']]}] - "
      end
    end
    detalhe << "Total de ativos lidos do azure: #{total_ativos_lidos} / "
    detalhe << "Total de ativos encontrados: #{total_ativos_encontrados} / "
    detalhe << "  Ativos nao encontrados: #{ativos_nao_achados} / " if ativos_nao_achados != ""

    detalhe << "Total de info criados: #{total_created} / "
    detalhe << "Total de info atualizados: #{total_replaced}"

    status = "Ok"

    Event.register("Carga", "Azure", "detalhe", "#{status} - #{detalhe}")
    [status, detalhe]
    end
end
