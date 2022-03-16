Rails.application.routes.draw do
  resources :item_types
  resources :items
  resources :closets
  resources :styles
  resources :preferences
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
