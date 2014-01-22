TestApp::Application.routes.draw do
  resources :user_conversations


  get "welcome/index"
  get "items/post"
  get "log_in_to_vote/index"
  get "profile/index"
  get "messages/popup"
 
 resources :conversations
 resources :items
 resources :messages
  # The priority is based upon order of creation:
  # first created -> highest priority.
  
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)


  
  #root :to => redirect('/welcome/index') uncomment this if you want to root to the landing page
  root :to => redirect('/items') #comment this out to root to landing page

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
  resources :items do
    member do
      post :vote
      post :unvote
    end
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  #root :to => 'items#index'
  match 'items/post', to: 'items#create', via: [:get, :post]
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
  # See how all your routes lay out with "rake routes"
  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
