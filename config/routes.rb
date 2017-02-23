Rails.application.routes.draw do
  get "password_resets/new"
  get "password_resets/edit"
  get "sessions/new"
  root "static_pages#home"
  get "/users/:id", to: "users#show"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    resources :relationships, only: [:index]
  end
  resources :acount_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :update, :edit]
  resources :microposts, only: [:create, :destroy]
  resources :relationships
end
