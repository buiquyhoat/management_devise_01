Rails.application.routes.draw do
  get "device_code/show"
  get "get_device_code/show"
  get "assignment_device/show"
  get "group_category/show"
  get "device_assign/show"
  get "requests/new"
  get "requests/add_request_detail"
  root "static_pages#home"

  delete "/requestdetails", to: "request_details#destroy"

  get    "/home",    to: "static_pages#home"
  get    "/about",   to: "static_pages#about"
  get    "/help",    to: "static_pages#help"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :users
  resources :devices
  resources :requests
  resources :request_details
  resources :assignments
  resources :notifications
  resources :request_status
  mount ActionCable.server => '/cable'
end
