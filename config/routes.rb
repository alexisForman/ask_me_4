Rails.application.routes.draw do

  get '/home', to: "static_pages#home"
  get '/aboutus', to: "static_pages#about_us"
  get '/rules', to: "static_pages#rules"
  get '/disclaimer', to: "static_pages#disclaimer"
  # get 'users/new'
  get '/signup', to: "users#new"
  # get 'users/create'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"

  delete '/logout', to: "sessions#destroy"

  get '/password_reset', to: "password_reset#new"
  post '/password_reset', to: "password_reset#create"
  get '/password_reset/edit', to: "password_reset#edit"
  patch '/password_reset/edit', to: "password_reset#update"


  resources :users, except: [:new]
  resources :photos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "static_pages#home"
end
