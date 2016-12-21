# ALTER TABLE statuscis AUTO_INCREMENT = 1
# statuscis
# site --> brasil
# testar criar CI sem tipo padrao
# tipo: fornecedor, contrato

Statusci.delete_all
Site.delete_all
Tipoci.delete_all

ActiveRecord::Migration.execute %Q{ ALTER TABLE Statuscis AUTO_INCREMENT = 1 }
ActiveRecord::Migration.execute %Q{ ALTER TABLE Sites AUTO_INCREMENT = 1 }
ActiveRecord::Migration.execute %Q{ ALTER TABLE Tipocis AUTO_INCREMENT = 1 }

Statusci.create([{:status => 'Ativo', :icon => "001_06.png" }, {:status => "Desativado", :icon => "001_05.png"}])
Site.create([{:nome => "Brasil", :estado => "BR"}])
Tipoci.create([{:tipo => "Contrato"}])
Tipoci.create([{:tipo => "Fornecedor"}])

Parametro.create({:tipo => "views_ci", :subtipo => "TI", :valor => '[["Descricao","Tipo","Localidade","Gestor","Usuario(s)","Ult ChgMgmt"],["descricao","tipo_ci","nome_localidade","Owner","notificacao","data_ultima_alteracao"]]'})
Parametro.create({:tipo => "Config", :subtipo => "Logo", :valor => 'logo.png'})

puts "\n\n\nATENCAO: Rodar tarefa do ThinksSphinx (parar, ts:configure, ts:regenerate, reiniciar)"



