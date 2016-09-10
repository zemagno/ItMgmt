require 'csv'
class ServiceCargaGenerico

  def go(paramfile)
    detalhe = ""
    status = "ok"

    total_replaced = 0
    total_created = 0
    total_readed = 0
    erros = " - ERROS:"

    arquivo = Parametro.get(:tipo => "PATH_Generic_Import", :subtipo => paramfile)

    if ! File.exist?(arquivo)
      puts "arquivo nao exite. Terminando tarefa"
      return "Erro"
    end


    dados = CSV.read(arquivo, headers: true)
    dados.each do |linha|
      total_readed = total_readed + 1
      chave = linha[:chave.to_s].gsub("\t","").strip

      c = Ci.find_by_chave(chave)

      if ! c.nil?
        begin
          dados.headers.each do |h|
            # puts "atualizando #{h} - #{linha[h].gsub("\t","").strip} - #{c.respond_to?(h)} - #{(c.respond_to?(h))  && (! linha[h].nil?) && (h != "chave")}"
            c.send("#{h}=",linha[h].gsub("\t","").strip) if (c.respond_to?(h))  && (! linha[h].nil?) && (h != "chave")
          end
          c.save!
          total_replaced = total_replaced + 1
        rescue Exception => e
          status = "Warning"
          erros << "#{chave} #{e.message}"
        end

      else
        status = "Warning"
        erros << " #{chave}"

      end

    end
    detalhe << "Total de registros Lidos: #{total_readed} / Total de registros atualizados #{total_replaced} "
    detalhe << erros if total_readed != total_replaced
    Event.register("CargaGenerica", paramfile, "detalhe", "#{status} - #{detalhe}")
    [status, detalhe]
  end
end