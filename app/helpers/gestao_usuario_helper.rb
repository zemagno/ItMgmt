module GestaoUsuarioHelper
  def funcionarioBloqueado? (funcionario)
    return false if ! funcionario || funcionario.nil?
    funcionario.afastado || funcionario.loginBloqueado 
  end

  def razaoFuncionarioBloqueado (funcionario)

    return "ATENCAO: NAO CONCEDER ACESSO NEM LIBERAR SENHA !! Motivo: Ferias ate #{funcionario.DataFimFerias.in_time_zone("Brasilia").strftime("%d/%m/%Y")}" if funcionario && funcionario.loginBloqueado && funcionario.justificativaLoginBloqueado=="Ferias"
    return "ATENCAO: NAO CONCEDER ACESSO NEM LIBERAR SENHA !! Motivo: #{funcionario.justificativaLoginBloqueado}" if funcionario && funcionario.loginBloqueado
    return "ATENCAO: Funcionario Afastado !!" if funcionario && funcionario.afastado
  end
end