Rails.application.routes.draw do
  get "sessions/new"
  root "static_pages#home"
  get "/users/:id", to: "users#show"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, only: [:show, :new, :create]
end
