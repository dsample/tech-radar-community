Techradarcommunity::Application.routes.draw do

  get "user_company_roles/new"

  get "user_company_roles/delete"

  match "/auth/:provider/callback" => "sessions#create", :as => :auth
  match "/signout" => "sessions#destroy", :as => :signout
  match "/login" => "sessions#login", :as => :login

  resources :companies

  scope ":company" do
    root to: "radar#index", as: :tenant_root

    get 'radar' => "radar#index"

    resources :products do
      resources :comments
      resources :product_technologies, path: 'usage', only: [:create] #, as: 'usage'
    end
    resources :technologies do
      resources :comments
      resources :recommends
    end
    resources :product_technologies

    resources :roles do
      resources :user_company_roles, as: 'members', path: 'members', only: [:create, :delete]
    end
    resources :categories
    resources :recommendations
    resources :states

  end



  # The priority is based upon order of creation:
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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
