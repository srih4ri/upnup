require 'sidekiq/web'


Rails.application.routes.draw do
  devise_for :people
  mount Sidekiq::Web => '/bgj'
  resources :photos, only: [:new, :index, :create]
  root to: 'photos#index'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :person do
        post 'login' => 'sessions#create', as: 'login'
      end

      resources :people, only: [:show, :create, :update, :destroy], constraints: { id: /.*/ }
    end
  end
end
