class ServiceCargaProjetos

  def go
    status = "Ok"
    detalhe = ""
    total = 0


    projetosRm = ProjetosRm.all
    ProjetosBrq.delete_all

    columns = ProjetosRm.column_names


    projetosRm.each do |p|
      projeto = ProjetosBrq.new
      columns.each  do |c|
        projeto.send("#{c}=", p[c]) if (projeto.respond_to?(c) and p[c].is_a? String)
        projeto.send("#{c}=", p[c]) if (projeto.respond_to?(c) and ! (p[c].is_a? String))
      end
      projeto.save!
      total = total +1
    end

    detalhe << "Projetos Carregagos: #{total}"


    Event.register("Carga","Projetos","detalhe","#{status} - #{detalhe}")

    [status,detalhe]
  end

end