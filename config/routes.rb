Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :styles

      resources :preferences

      resources :users

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "preferences#index"
  resources :saved_items
  resources :lend_transactions
  resources :number_sizes
  resources :letter_sizes
  resources :item_types
  resources :items
  resources :closets
  resources :styles
  resources :preferences
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
