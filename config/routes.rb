Rails.application.routes.draw do
  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :users, only: :create
      resources :doctors, only: :index
      resources :hospitals, only: :index
    end
  end
end
