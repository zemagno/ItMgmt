class ServiceCargaAzure

  def go

      configNuvem=JSON.parse Parametro.get(:tipo => "MappingNuvem", :subtipo => "Azure")

      resultadoNuvem = JSON.parse File.read(configNuvem["file"])


      resultadoNuvem.each do |servidor|

      	puts "#{servidor}"
      	puts "vou procurar um servidor #{servidor[configNuvem["chave"]]}"
        ci = Ci.find_by_chave(servidor[configNuvem["chave"]])

        if ci
          configNuvem["mapping"].each do |k,v|
            no = servidor
            v.each { |n| no = no[n]}
            ci.send("#{k}=",no) if ci.respond_to?(k)
          end
        end
      end
    end
end
