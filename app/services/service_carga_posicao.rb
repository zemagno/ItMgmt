class ServiceCargaPosicao

def go
	status = "Erro"
	detalhe = ""
	total = 0
	antes = MapaPosicao.count *1.0
	carga = MapaPosicaoRm.count *1.0
	if carga != 0 
		MapaPosicao.delete_all
	    MapaPosicaoRm.all.each do |m|
		   m.NomSite = m.NomSite.force_encoding("ISO-8859-1").encode("UTF-8")
		   m.NomAndarSite = m.NomAndarSite.force_encoding("ISO-8859-1").encode("UTF-8")
		   m.NomTipoPosicao = m.NomTipoPosicao.force_encoding("ISO-8859-1").encode("UTF-8")
		   MapaPosicao.create(m.attributes)
		   total = total + 1
		end
	end
	depois = MapaPosicao.count * 1.0
	if carga==0.0 
		status = "Erro"
		detalhe = "Carga sem dados"
	elsif (((antes-carga).abs / carga) > 0.10) || (((depois-carga).abs / carga) > 0.10) || (((depois-antes).abs / antes) > 0.10)
		status = "Warning"
		detalhe = "Carga discrepante"
	elsif (carga != depois)
		status = "Erro"
		detalhe = "Carga efetuado com erro."
	else
		status = "Ok"
		detalhe = "Carga efetuado com sucesso."
	end
		
	detalhe << " - Antes: #{antes} - Carga: #{carga} - Depois: #{depois}"

	Event.register("Carga","Posicao","detalhe","#{status} - #{detalhe}")
	
	[status,detalhe]
end

end

