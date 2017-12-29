Rails.application.routes.draw do

  get    ''                        => 'sessions#new'
  get    'sessions/new'            => 'sessions#new'    , as: 'sessionNew'
  post   'sessions'                => 'sessions#log_in' , as: 'sessionCreate'
  delete 'sessions/:user_id'       => 'sessions#destroy', as: 'sessionDestroy'
  post   'users'                   => 'users#create'    , as: 'userCreate'
  get    'users/new'               => 'users#new'       , as: 'userNew'
  #get    'users/dashboard'         => 'users#dashboard' , as: 'userDashboard'  
  get    'users/:user_id'          => 'users#show'      , as: 'userShow'
  get    'users/:user_id/edit'     => 'users#edit'      , as: 'userEdit'
  patch  'users/:user_id'          => 'users#update'    , as: 'userUpdate'
  delete 'users/:user_id'          => 'users#destroy'   , as: 'userDestroy'
  post   'users/:user_id/secrets/' => 'secrets#create'  , as: 'secretCreate'
  delete 'users/:user_id/secrets/:secret_id' => 'secrets#destroy' , as: 'secretDestroy'
  get    'secrets'                 => 'secrets#index'   , as: 'secretsIndex'
  post   'secrets/:secret_id/like' => 'secrets#like'    , as: 'secretsLike'  
  post   'secrets/:secret_id/unlike' => 'secrets#unlike'    , as: 'secretsUnlike'  
  delete 'secrets/:secret_id/'     => 'secrets#destroy2'    , as: 'secretsDestroy2'  


 # get 'users/edit'

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
