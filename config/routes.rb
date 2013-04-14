ItMgmt::Application.routes.draw do

  resources :statuscis


  resources :view_templates

  resources :padrao_checklists

  resources :eventos

  resources :areafornecedores

  # para todos nao ser confundido com ID
  match '/contratos/todos', to: 'contratos#todos'
  match '/fornecedores/todos', to: 'fornecedores#todos'
  match '/tasks/todos', to: 'tasks#todos'  
  match '/cis/todos', to: 'cis#todos'  

  resources :parametros, :only => [:index,:edit,:update]

  resources :dicdados

  resources :contratos do
       collection do
         get 'erros'
       end
  end

  resources :indicadores_financeiros

  resources :fornecedores

  resources :tipocontratos

  root :to => "tasks#index"
  

  
  # :as --> criar o help ci_path
  # gera uma entrada no rake routes
  # ci        /CMDB/:id(.:format)                   {:controller=>"ci", :action=>"show"}
  
  
  match 'cis/:id/impactados', to: "cis#impactados",  :as => :impactados
  match 'cis/:id/dependentes', to: "cis#dependentes",  :as => :dependentes
  match 'cis/:id/dependentes_all', to: "cis#dependentes_all",  :as => :dependentes_all
  match 'cis/:id/grafico_impactados', to: "cis#grafico_impactados",  :as => :grafico_impactados
  match 'cis/:id/impactados_h', to: "cis#impactados_h", :as => :impactados_h
  match 'cis/:id/dependentes_h', to: "cis#dependentes_h", :as => :dependentes_h
 
  post 'cis/:id/novo_dependente', to: "cis#gera_novo_dependente", :as => :gera_novo_dependente
  match 'cis/:id/novo_dependente', to: "cis#novo_dependente", :as => :novo_dependente
  post 'cis/:id/novo_impactado', to: "cis#gera_novo_impactado", :as => :gera_novo_impactado
  match 'cis/:id/novo_impactado', to: "cis#novo_impactado", :as => :novo_impactado
 
  post 'cis/:id/elimina_dependente', to: "cis#elimina_dependente", :as => :elimina_dependente
  match 'cis/:id/elimina_dependente', to: "cis#ask_elimina_dependente", :as => :ask_elimina_dependente
  post 'cis/:id/elimina_impactado', to: "cis#elimina_impactado", :as => :elimina_impactado
  match 'cis/:id/elimina_impactado', to: "cis#ask_elimina_impactado", :as => :ask_elimina_impactado
 
  match 'cis/:id/confirmar_eliminacao', to: "cis#confirmar_eliminacao", :as => :confirmar_eliminacao
  post 'cis/:id/cis_eliminar', to: "cis#eliminar", :as => :eliminar_ci
  match 'cis/checkChave', to: "cis#check_chave"
  
  match 'cis/search', to: "cis#search"
  match 'cis/sobe', to: "cis#sobe"
  match 'cis/desce', to: "cis#desce"
  match 'CMDB', to: "cis#index"
  
  match 'email/:acao/:id', to: "email#enviar"
  
  resources :cis
  
  resources :pedidos

  resources :status_pedidos

  resources :notificacaos

  resources :criticidades

  resources :sites

  resources :tasks

  resources :categories

  resources :authors
  
  resources :console
  
  resources :tipocis
  


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
