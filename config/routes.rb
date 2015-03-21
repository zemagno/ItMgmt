require 'sidekiq/web'

ItMgmt::Application.routes.draw do

  get "painel_producao/index"

namespace :custom do
   match "GestaoUsuarios", to: "GestaoUsuarios#index", as: "gestao_usuarios"
   get "GestaoUsuarios/:id/confirmarremocaolicenca/:licenca", to: "GestaoUsuarios#confirmar_remocao_licenca", as: "confirmar_remocao_licenca"
   post "GestaoUsuarios/deletelicenca", to: "GestaoUsuarios#remover_licenca", as: "remover_licenca"
   post "GestaoUsuarios/AlocarLicenca", to: "GestaoUsuarios#alocar_licenca", as: "alocar_licenca"
   get "GestaoUsuario/EscolherLicencaAlocar",  to: "GestaoUsuarios#escolher_licenca_alocar", as: "escolher_licenca_alocar"
   get "GestaoUsuario/AlocarEstacao",  to: "GestaoUsuarios#alocar_estacao", as: "alocar_estacao"
end
# match '/404' => 'errors#not_found'
# match '/422' => 'errors#server_error'

  resources :funcionarios, :only => [:index,:show]


  resources :template_surveys


  resources :cadsurveys


  match "survey/:id", to: "survey#show"

  get "ajax/cis"

  resources :area_responsabilidades


  resources :custom_de_paras


  resources :events, :only => [:index]

resources :fornecedores

  resources :mailings
  match "mailings/enviar_email", to: "mailings#enviar_email"
  match "mailings/enviar_email_sql", to: "mailings#enviar_email_sql"
  match "mailings/confirma_enviar_email", to: "mailings#confirma_enviar_email"
  match "mailings/confirma_enviar_email_sql", to: "mailings#confirma_enviar_email_sql"




  resources :notes


  resources :status_incidentes


  resources :templates_emails


  resources :sql_templates


  root :to => "tasks#index"

  ActiveAdmin.routes(self)

  #resources :init_checklists


  mount Sidekiq::Web, at: '/sidekiq'
  resources :snippets
  #match 'mailer(/:action(/:id(.:format)))' => 'mailer#:action'

  resources :exec_itens_checklists

  resources :ramal, :only => [:index]
  resources :exec_checklists, :only => [:show, :index]


  resources :checklists do
      resources :init_checklists, :only => [:create, :new, :delete]
  end


  resources :itens_checklists


  #resources :status_checklists


  resources :audits


  #match "audits", to: "audits#index"
  #match "/audits/:id", to: "audits#show"

  #mount Sidekiq::Web, at: '/sidekiq'
  # match "ramais", to: "ramal_login#index"
  # match "ramais/new", to: "ramal_login#new"
  # match "tel_ramal_login", to: "ramal_login#index"
  # match "tel_ramal_logins", to: "ramal_login#index" #TODO limpar esse lixo..
  
  resources :tipotasks
  resources :tipo_tasks
  resources :atributos


  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  match 'destroy_admin_user_session_path', to: 'sessions#destroy'
  match 'destroy_admin_user_session', to: 'sessions#destroy'

  resources :cadrelatorios
  resources :statuscis
   
    # para todos nao ser confundido com ID


  match 'relatorio/:id', to: "relatorio#index", as: "relatorio"
  match 'email/:acao/:id', to: "email#enviar"
  match 'email/enviar_email/:id', to: "email#enviar+email"

  match '/tasks/todos', to: 'tasks#todos'  
  match '/cis/todos', to: 'cis#todos'  
  match '/tasks/:id/new_from_ci', to: 'tasks#new_from_ci', as: "tasks_new_from_ci"

  resources :parametros , :only => [:index,:edit,:update]

  resources :dicdados

 

  
  # :as --> criar o help ci_path
  # gera uma entrada no rake routes
  # ci        /CMDB/:id(.:format)                   {:controller=>"ci", :action=>"show"}
  
  get 'cis/:id/email', to: "cis#email",  :as => :email
  post 'cis/:id/email', to: "cis#enviar_email",  :as => :enviar_email
  
  
  match 'cis/:id/impactados', to: "cis#impactados",  :as => :impactados
  match 'cis/:id/dependentes', to: "cis#dependentes",  :as => :dependentes
  match 'cis/:id/dependentes_all', to: "cis#dependentes_all",  :as => :dependentes_all
  match 'cis/:id/grafico_impactados', to: "cis#grafico_impactados",  :as => :grafico_impactados
  match 'cis/:id/impactados_h', to: "cis#impactados_h", :as => :impactados_h
  match 'cis/:id/dependentes_h', to: "cis#dependentes_h", :as => :dependentes_h
  #match 'cis/:id/abrir_alerta', to: "cis#abrir_alerta", :as => :abrir_alerta
 
  post 'cis/:id/novo_dependente', to: "cis#gera_novo_dependente", :as => :gera_novo_dependente
  match 'cis/:id/novo_dependente', to: "cis#novo_dependente", :as => :novo_dependente
  post 'cis/:id/novo_impactado', to: "cis#gera_novo_impactado", :as => :gera_novo_impactado
  match 'cis/:id/novo_impactado', to: "cis#novo_impactado", :as => :novo_impactado
 
  post 'cis/:id/elimina_dependente', to: "cis#elimina_dependente", :as => :elimina_dependente
  match 'cis/:id/elimina_dependente', to: "cis#ask_elimina_dependente", :as => :ask_elimina_dependente
  post 'cis/:id/elimina_impactado', to: "cis#elimina_impactado", :as => :elimina_impactado
  match 'cis/:id/elimina_impactado', to: "cis#ask_elimina_impactado", :as => :ask_elimina_impactado
 
  post 'cis/:id/duplicar_ci', to: "cis#duplicar_ci", :as => :duplicar_ci
  match 'cis/:id/duplicar_ci', to: "cis#ask_duplicar_ci", :as => :ask_duplicar_ci
  

  match 'cis/:id/confirmar_eliminacao', to: "cis#confirmar_eliminacao", :as => :confirmar_eliminacao
  post 'cis/:id/cis_eliminar', to: "cis#eliminar", :as => :eliminar_ci
  match 'cis/checkChave', to: "cis#check_chave"

  
  match 'cis/search', to: "cis#search"
  match 'cis/sobe', to: "cis#sobe"
  match 'cis/desce', to: "cis#desce"
  match 'CMDB', to: "cis#index"
  
  resources :cis
  
  resources :notificacaos

  resources :criticidades

  resources :sites

  resources :tasks

  resources :categories

  resources :authors
  
  resources :console
  
  resources :tipocis
  

  match '/404' => 'errors#not_found'
  match '/422' => 'errors#server_error'
  match '/500' => 'errors#server_error'

  match '*a', :to => 'tasks#index'

  # The priority is beed upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
