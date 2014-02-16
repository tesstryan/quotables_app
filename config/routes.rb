QuotablesApp::Application.routes.draw do
  
  root 'quotes#index'

   get '/download' => 'quotes#download', :as => 'download_quote'

  # Routes for the Quote resource:
  # CREATE
  get '/quotes/new', controller: 'quotes', action: 'new', as: 'new_quote'
  post '/quotes', controller: 'quotes', action: 'create', as: 'quotes'

  # READ
  get '/quotes', controller: 'quotes', action: 'index'
  get '/quotes/:id', controller: 'quotes', action: 'show', as: 'quote'

  # UPDATE
  get '/quotes/:id/edit', controller: 'quotes', action: 'edit', as: 'edit_quote'
  patch '/quotes/:id', controller: 'quotes', action: 'update'

  # DELETE
  delete '/quotes/:id', controller: 'quotes', action: 'destroy'
  #------------------------------

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
