class ServiceCargaGestores

  def go
    status = "Ok"
    detalhe = ""
    total = 0

    gestoresRm = GestoresRm.all




    Gestores.delete_all

    columns = GestoresRm.column_names


    gestoresRm.each do |g|
      gestor = Gestores.new
      columns.each  do |c|
        gestor.send("#{c}=", g[c]) if gestor.respond_to?(c)
      end
      gestor.save!
      total = total +1
    end

    detalhe << "Gestores Carregagos: #{total}"


    Event.register("Carga","Gestores","detalhe","#{status} - #{detalhe}")

    [status,detalhe]
  end

end
