class ServiceCargaFerias

  def go
    status = "Ok"
    detalhe = ""
    total = 0

    funcFerias= FuncionarioFerias.all


    
    Funcionario.where('justificativaLoginBloqueado="Ferias"').update_all("loginBloqueado=0, DataInicioFerias=null, DataInicioFerias=null")


    funcFerias.each do |f|
      func = Funcionario.find_by_Login(f.IdtUsuario)
      func.DataInicioFerias = f.DataInicioFerias
      func.DataFimFerias = f.DataFimFerias
      func.loginBloqueado = (DateTime.now <= f[0].DataFimFerias) && (DateTime.now >= f[0].DataInicioFerias)
      func.justificativaLoginBloqueado = "Ferias"
      func.save!
      total = total + 1
    end

    detalhe << "Funcionarios Ferias: #{total}"


    Event.register("Carga","RM Func Ferias","detalhe","#{status} - #{detalhe}")

    [status,detalhe]
  end

end