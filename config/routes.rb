Rails.application.routes.draw do
  mount Apidoco::Engine, at: '/docs'

  root 'apidoco/apis#index'

  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :users, only: :create
      resources :tokens, only: :create
      resources :doctors, only: :index
      resources :hospitals, only: :index
      resources :appointments, only: :create
    end
  end
end
