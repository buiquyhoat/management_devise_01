Rails.application.routes.draw do
  get "devices/new"

  root   "static_pages#home"
  get    "/home",    to: "static_pages#home"
  get    "/about",   to: "static_pages#about"
  get    "/help",    to: "static_pages#help"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :users
  resources :devices
end
