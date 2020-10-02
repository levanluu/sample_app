Rails.application.routes.draw do
  root "static_pages#home"
  get "/help",  to: "static_pages#help"
  get "/contact", to: "static_pages#contact"
  get "/signup",  to: "users#new"
  post "/signup", to: "users#create"
  post "/signup", to: "users#show"
  get "/login", to: "sessions#new"
  post "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/edit", to: "users#edit"
  resources :users
  resources :account_activations, only: :edit
end
