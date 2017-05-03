Rails.application.routes.draw do

  root to: "pages#index"

  resources :listings, controller: "listings"

  resources :listings do 
     resources :reservations, only: [:create]
   end
  resources :reservations, only: [:destroy]

  resources :tags, controller: "tags" do
   resource :listings, controller: "tags"
  end

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]
  
  resources :users
  resources :users, controller: "users", only: [:create, :new] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end



  # resources :users, controller: "users", only: [:show] do
  #   resources :listings,
  #     controller: "listings",
  #     only: [:create, :edit, :update, :show]
  # end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
