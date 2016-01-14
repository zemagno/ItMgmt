class ServiceProducaoAcertaLicencas
  def go

    licencasAcertar = JSON.parse(Parametro.get(:tipo => "PRODUCAO", :subtipo => "AcertaLicencasInclusasVSPremium"))

    status = "Ok"
    detalhe = ""
    totalUpdated = 0

    licencasAcertar.each do |acao|
      hosts = ActiveRecord::Base.connection.execute(acao[0])
      resultado = []
      hosts.each{ |res| resultado << res[0] }
      totalUpdated = totalUpdated + resultado.count
      cmd = acao[1].gsub! "{filtro}", resultado.join(",")
      ActiveRecord::Base.connection.execute(cmd)
      puts cmd
    end
    detalhe << "Acerta Licencas - total de #{totalUpdated} licencas atualizadas"
    [status,detalhe]
  end
end
