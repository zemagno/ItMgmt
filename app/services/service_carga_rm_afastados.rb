class ServiceCargaRmAfastados

  def go
    status = "Ok"
    detalhe = ""
    total = 0

    funcAfastados= FuncionarioRmAfastado.all


    # f2 = duas bases de dados de funcionarios (12115 registros)
    
    Funcionario.update_all("afastado=0, DataInicioAfastamento=null, DataInicioAfastamento=null")

    funcAfastados.each do |f|
      func = Funcionario.find_by_Login(f.Login)
      func.afastado = true # (DateTime.now <= f[0].DTFINAL) && (DateTime.now >= f[0].DTINICIO)
      func.DataInicioAfastamento = f.DTINICIO
      func.DataFinalAfastamento = f.DTFINAL
      func.save!
      total = total + 1
    end

    detalhe << "Funcionarios afastados: #{total}"


    Event.register("Carga","RM Func Afastados","detalhe","#{status} - #{detalhe}")

    [status,detalhe]
  end

end


