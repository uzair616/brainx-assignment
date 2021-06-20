Rails.application.routes.draw do
  root   'repositories#index'
  resources :users
  resources :repositories, except: [:index]
end
