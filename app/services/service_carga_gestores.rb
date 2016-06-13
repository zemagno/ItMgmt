class ServiceCargaGestores

  def go
    status = "Ok"
    detalhe = ""
    total = 0


    gestores = {}
    Gestores.all.map { |g| gestores[g.LoginUsuario] = g}

    gestoresRm = {}
    GestoresRm.all.map { |g| gestoresRm[g.LoginUsuario] = g}



    mudaram = gestoresRm.map { |k,v| v if (! gestores[k].nil?)    && ! (v["ESTADO"] == gestores[k]["ESTADO"])}.delete_if { |k| k.nil?}

    novos = gestoresRm.map { |k,v| v if gestores[k].nil? }.delete_if { |k| k.nil?}

    excluir = gestores.map { |k,v| v if gestoresRm[k].nil? }.delete_if { |k| k.nil?}

    mudaram.each do |g|
      ProducaoAd.create(:userid => g["LoginUsuario"], :parametro => g["ESTADO"], :cmd => "MudarGrupoEmailGestor", :acao => "MudarGrupoEmailGestor", :processado => false  )
    end

    excluir.each do |g|
      ProducaoAd.create(:userid => g["LoginUsuario"], :parametro => g["ESTADO"], :cmd => "ExcluirGrupoEmailGestor", :acao => "ExcluirGrupoEmailGestor", :processado => false  )
    end

    novos.each do |g|
      ProducaoAd.create(:userid => g["LoginUsuario"], :parametro => g["ESTADO"], :cmd => "IncluirGrupoEmailGestor", :acao => "IncluirGrupoEmailGestor", :processado => false  )
    end



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
