Rails.application.routes.draw do
  root "static_pages#home"
  get "/help",    to: "static_pages#help"
  get "/contact", to: "static_pages#contact"
  get "/signup",  to: "users#new"
  post "/signup", to: "users#create"
  post "/signup", to: "users#show"
  resources :users, only: %i(new create show)
end
