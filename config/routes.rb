Rails.application.routes.draw do
  root "static_pages#home"
  get "/users/:id", to: "users#show"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users, only: [:show, :new, :create]
end
