Resumonk::Application.routes.draw do
  resources :skills
  resources :experiences
  resources :educations
  resources :users do
    resources :resumes
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  match "/signup" => "users#new", as: :signup
  
  match "/login" => "sessions#new", as: :login
  match "/logout" => "sessions#destroy", as: :logout
  
  match "/toc" => "static_pages#toc", as: :toc
  match "/about" => "static_pages#about", as: :about
  match "/faq" => "static_pages#faq", as: :faq
  match "/privacy_policy" => "static_pages#privacy", as: :privacy
  match "users/:user_id/show_links/:id" => "resumes#show_links", as: :show_links
  match "users/:user_id/show_template/:id" => "resumes#show_template", as: :show_template
  put "users/:user_id/choose_template/:id" => "resumes#choose_template", as: :choose_template
  root to: "static_pages#home", as: :root
  
  get "/r/:short_link" => "resumes#short_link", as: :short_link_path
  
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
