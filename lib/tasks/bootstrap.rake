# rake bootstrap:all

namespace :bootstrap do
      
      desc "Create default cis view"
      task :default_parametros => :environment do
        Parametro.create( :tipo => 'views_ci', :subtipo => 'TI', :valor => '[["Descricao","Tipo","Localidade","Gestor","Usuario(s)","Ult ChgMgmt"],["descricao","tipo_ci","nome_localidade","Owner","notificacao","data_ultima_alteracao"]]' )
      end

      desc "Create default status"
      task :default_status => :environment do
        Statusci.create( :status => 'Ativo', :icon => "001_06.png")
        Statusci.create( :status => 'Desativado', :icon => "001_05.png", :parametro => ' {"color":"magenta" , "style":"filled", "fillcolor":"red"}')
        Statusci.create( :status => 'Em ativacao', :icon => "001_24.png", :parametro => ' {"color":"magenta" , "style":"filled", "fillcolor":"red"}')
        Parametro.create( :tipo => 'CI', :subtipo => 'FiltroStatus', :valor => '[["Cliente",["Ativo","Em ativacao","Desativado"]]]' )
      end

      desc "Create default sites"
      task :default_sites => :environment do
        Site.create( :nome => 'Rio de Janeiro', :estado => 'RJ' )
      end

      desc "Run all bootstrapping tasks"
      task :all => [:default_parametros,:default_status, :default_sites]
    end