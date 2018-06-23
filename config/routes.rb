Rails.application.routes.draw do
  resources :likes, only: [:index, :show, :create, :destroy]
  resources :peeps
  resources :users, only: [:index, :show, :create]
  resources :sessions, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
