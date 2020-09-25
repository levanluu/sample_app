Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
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
<<<<<<< HEAD
=======
  resources :account_activations, only: :edit
  resources :password_resets, only: [:new, :create, :edit, :update]
<<<<<<< HEAD
>>>>>>> chapter 12: Password reset
=======
  resources :microposts, only: [:create, :destroy]
>>>>>>> chapter 13 User microposts
end
