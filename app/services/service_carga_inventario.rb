require 'csv'
class ServiceCargaInventario

  def go

    detalhe = ""
    status = "ok"

    total_replaced = 0
    total_created = 0

    InventarioSw.delete_all
    path = Parametro.get(:tipo => "PATH", :subtipo => "MassiveImportInventario")
    config = JSON.parse(File.read(path))

    config.each do |provider, file|
      f = File.open(file, "r")
      detalhe << "Provider #{provider} - "

      f.each_line do |linha|

        dados = linha.force_encoding("ISO-8859-1").encode("UTF-8").gsub(/;/, ",").gsub(/"/, "").split(",")
        hostname = dados[0].split(".")[0].rstrip.lstrip
        software = dados[1]
        software = software.rstrip.lstrip if ! software.nil?

        # puts "Vou procurar por #{hostname} #{software}"
        inv = InventarioSw.find_or_initialize_by(hostname: hostname,software: software)
        if inv.id.nil?
          # puts "nao achei"
          total_created = total_created + 1
          inv.total = 0
        else
          # puts "achei"
          total_replaced = total_replaced + 1
        end
        if inv.respond_to?("src#{provider}") && ! dados[1].nil?
          inv.send("src#{provider}=", "SIM")
          inv.total = inv.total+1
        end

        inv.save!

      end
      detalhe << "Total de registros criado #{total_created} - "
      detalhe << "Total de registros atualizados #{total_replaced}"
      detalhe << " / "
    end



    Event.register("Carga", "Inventario Software", "detalhe", "#{status} - #{detalhe}")
    [status, detalhe]
  end

end
