# ALTER TABLE statuscis AUTO_INCREMENT = 1
# statuscis
# site --> brasil
# testar criar CI sem tipo padrao
# tipo: fornecedor, contrato

Statusci.create([{:status => 'Ativo', :icon => "001_06.png" }, {:status => "Desativado", :icon => "001_05.png"}])
Site.create([{:nome => "Brasil", :estado => "BR"}])
Tipocis.create([{:tipo => "Contrato"}],[{:tipo => "Fornecedor"}])