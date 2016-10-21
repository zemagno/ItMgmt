require 'sidekiq/web'

ItMgmt::Application.routes.draw do


  resources :incidentes


  resources :grupos


  resources :comandos_automacaos


  resources :softwares




  get "Inventario/PorHostname/:id", to: "inventario#porHostname", as: "InventarioPorHostname"
  
  get "Licencas/PorGestor/:id(/:versao)", to: "licencas#porGestor", as: "LicencasPorGestor" , :constraints => { :id => /[a-zA-z0-9.]*/ }

  get "Licencas/PorUsuario/:id", to: "licencas#porUsuario", as: "LicencasPorUsuario" , :constraints => { :id => /.*/ }


  get "identities/:id", to: "identities#show", as: "identities" , :constraints => { :id => /.*/ }

  post "ws_register_desligamento", to: "log_desligamento#ws_register_desligamento"
  resources :users , except: :new


  resources :schedulers
  # get "schedulers/:id/run", to: "schedulers#run", as: "scheduler_run"
  post "schedulers/:id/run", to: "schedulers#run", as: "scheduler_run"



  resources :producaos , :only => [:index]



  get "painel_producao/:id/(:scope)" , to:"painel_producao#index", as: "painel_producao"
  # get "painel_producao/:id" , to:"painel_producao#index", as: "painel_producao"



 get "GestaoUsuarios", to: "gestao_usuarios#index", as: "gestao_usuarios", :constraints => { :id => /.*/ }

  get 'GestaoUsuarios/:id/email', to: "gestao_usuarios#email", :constraints => { :id => /.*/ },  :as => :email_gestao_usuario
  post 'GestaoUsuarios/:id/email', to: "gestao_usuarios#enviar_email", :constraints => { :id => /.*/ },  :as => :enviar_email_gestao_usuario


  post "GestaoUsuarios/AlocarEstacao",  to: "gestao_usuarios#alocar_estacao", as: "alocar_estacao"
  get "GestaoUsuarios/EscolherLicencaAlocar",  to: "gestao_usuarios#escolher_licenca_alocar", as: "escolher_licenca_alocar"
  get "GestaoUsuarios/EscolherEstacaoAlocar",  to: "gestao_usuarios#escolher_estacao_alocar", as: "escolher_estacao_alocar"
  get "GestaoUsuarios/:id/confirmardesalocarestacao/:estacao", to: "gestao_usuarios#confirmar_desalocar_estacao", as: "confirmar_desalocar_estacao", :constraints => { :id => /.*/ }
  get "GestaoUsuarios/:id/imprimirtermoentrega/:tipo/:ativo", to: "gestao_usuarios#imprimir_termo_entrega", as: "imprimir_termo_entrega", :constraints => { :id => /.*/ }
  get "GestaoUsuarios/:id/imprimirtermodevolucao/:tipo/:ativo", to: "gestao_usuarios#imprimir_termo_devolucao", as: "imprimir_termo_devolucao", :constraints => { :id => /.*/ }
  get "GestaoUsuarios/:id/confirmarremocaolicenca/:licenca", to: "gestao_usuarios#confirmar_remocao_licenca", as: "confirmar_remocao_licenca", :constraints => { :id => /.*/ }
  post "GestaoUsuarios/AlocarLicenca", to: "gestao_usuarios#alocar_licenca", as: "alocar_licenca"
  post "GestaoUsuarios/deletelicenca", to: "gestao_usuarios#remover_licenca", as: "remover_licenca"
  post "GestaoUsuarios/DesalocarEstacao", to: "gestao_usuarios#desalocar_estacao", as: "desalocar_estacao"

  # match '/404' => 'errors#not_found'
  # match '/422' => 'errors#server_error'

  resources :funcionarios , :constraints => { :id => /.*/ }
  get 'equipe/:id', to: "funcionarios#equipe", :constraints => { :id => /.*/ }, as: "equipe"


  resources :template_surveys


  resources :cadsurveys


  # match "survey/:id", to: "survey#show"

  get "ajax/cis"
  get "ajax/gestores"

  resources :area_responsabilidades


  resources :custom_de_paras


  resources :events, :only => [:index]

  resources :mailings
  get  "mailings/enviar_email", to: "mailings#enviar_email"
  get "mailings/enviar_email_sql", to: "mailings#enviar_email_sql"
  get "mailings/confirma_enviar_email", to: "mailings#confirma_enviar_email"
  get "mailings/confirma_enviar_email_sql", to: "mailings#confirma_enviar_email_sql"




  resources :notes


  resources :status_incidentes


  resources :templates_emails


  resources :sql_templates


  root :to => "cis#index"


  #resources :init_checklists


  mount Sidekiq::Web, at: '/sidekiq'
  resources :snippets
  #match 'mailer(/:action(/:id(.:format)))' => 'mailer#:action'

  resources :ramal, :only => [:index]
  resources :exec_checklists, :only => [:show, :index]


  resources :checklists do
    resources :init_checklists, :only => [:create, :new, :delete]
  end


  resources :audits
  resources :tipotasks
  resources :tipo_tasks
  resources :atributos


  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  match 'destroy_admin_user_session_path', to: 'sessions#destroy', via: [:get, :post]
  match 'destroy_admin_user_session', to: 'sessions#destroy', via: [:get, :post]

  resources :cadrelatorios
  match 'cadrelatorios/:id/duplicar', to: "cadrelatorios#duplicar", :as => :duplicar_relatorio, via: [:get, :post]

  resources :statuscis

  # para todos nao ser confundido com ID


  match 'relatorio/:id', to: "relatorio#index", as: "relatorio", via: [:get, :post]
  match 'email/:acao/:id', to: "email#enviar", via: [:get, :post]
  match 'email/enviar_email/:id', to: "email#enviar+email", via: [:get, :post]

  match '/tasks/todos', to: 'tasks#todos', via: [:get, :post]
  match '/cis/todos', to: 'cis#todos', via: [:get, :post]

  match '/tasks/:id/new_from_ci', to: 'tasks#new_from_ci', as: "tasks_new_from_ci", via: [:get, :post]

  resources :parametros #, :only => [:index,:edit,:update,:new]

  resources :dicdados

  #match '/admin/massiveupdate', to: 'massiveupdate#index', as: "massiveupdate"




  # :as --> criar o help ci_path
  # gera uma entrada no rake routes
  # ci        /CMDB/:id(.:format)                   {:controller=>"ci", :action=>"show"}

  get 'cis/:id/email', to: "cis#email",  :as => :email
  post 'cis/:id/email', to: "cis#enviar_email",  :as => :enviar_email
  get "cis/:id/log", to: "cis#log", as: "log_ci"
  post 'cis/:id/log', to: "cis#register_log",  :as => :register_log

  get 'cis/:id/impactados', to: "cis#impactados",  :as => :impactados
  get 'cis/:id/dependentes', to: "cis#dependentes",  :as => :dependentes
  get 'cis/:id/dependentes_all', to: "cis#dependentes_all",  :as => :dependentes_all
  get 'cis/:id/grafico_impactados', to: "cis#grafico_impactados",  :as => :grafico_impactados
  get 'cis/:id/impactados_h', to: "cis#impactados_h", :as => :impactados_h
  get 'cis/:id/dependentes_h', to: "cis#dependentes_h", :as => :dependentes_h
  #get 'cis/:id/abrir_alerta', to: "cis#abrir_alerta", :as => :abrir_alerta

  post 'cis/:id/novo_dependente', to: "cis#gera_novo_dependente", :as => :gera_novo_dependente
  match 'cis/:id/novo_dependente', to: "cis#novo_dependente", :as => :novo_dependente, via: [:get, :post]
  post 'cis/:id/novo_impactado', to: "cis#gera_novo_impactado", :as => :gera_novo_impactado
  match 'cis/:id/novo_impactado', to: "cis#novo_impactado", :as => :novo_impactado, via: [:get, :post]

  post 'cis/:id/elimina_dependente', to: "cis#elimina_dependente", :as => :elimina_dependente
  match 'cis/:id/elimina_dependente', to: "cis#ask_elimina_dependente", :as => :ask_elimina_dependente, via: [:get, :post]
  post 'cis/:id/elimina_impactado', to: "cis#elimina_impactado", :as => :elimina_impactado
  match 'cis/:id/elimina_impactado', to: "cis#ask_elimina_impactado", :as => :ask_elimina_impactado, via: [:get, :post]

  post 'cis/:id/duplicar_ci', to: "cis#duplicar_ci", :as => :duplicar_ci
  match 'cis/:id/duplicar_ci', to: "cis#ask_duplicar_ci", :as => :ask_duplicar_ci, via: [:get, :post]
  

  match 'cis/:id/confirmar_eliminacao', to: "cis#confirmar_eliminacao", :as => :confirmar_eliminacao, via: [:get, :post]
  post 'cis/:id/cis_eliminar', to: "cis#eliminar", :as => :eliminar_ci
  match 'cis/checkChave', to: "cis#check_chave", via: [:get, :post]

  match 'cis/massiveupdate', to: "cis#massiveupdate", via: [:get, :post]
  # match '/cis2', to: 'cis#index2'


  get 'cis/search', to: "cis#search"
  get 'CMDB', to: "cis#index"

  resources :cis
  resources :criticidades

  resources :sites

  resources :tasks

  resources :categories

  resources :authors

  resources :console

  resources :tipocis

  get '/404' => 'errors#not_found'            , :via => :all
  get '/422' => 'errors#server_error'         , :via => :all
  get '/500' => 'errors#internal_server_error', :via => :all

  get '*a', :to => 'cis#index'


end
