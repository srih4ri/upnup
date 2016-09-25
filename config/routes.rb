require 'sidekiq/web'


Rails.application.routes.draw do
  devise_for :people
  mount Sidekiq::Web => '/bgj'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :photos, only: [:new, :index, :create]
  root to: 'photos#index'
end
