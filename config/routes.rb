Rails.application.routes.draw do
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/checkout", to: "orders#new", as: "checkout"
  post "/checkout", to: "orders#create"
  get "/cart", to: "carts#show"
  patch "/edit_name/:id", to: "users#edit_name", as: "edit_name"

  resources :users
  resources :cartitems
  resources :carts
  resources :shopper, only: [:index, :show]
  resources :products
  resources :orders, only: [:new, :create, :show, :index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  
  root("shopper#index", as: "shopperindex") #shopperindex_path

end
