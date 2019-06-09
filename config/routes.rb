Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :notebooks
    end
  end

  resources :app, only: :index

  root to: 'welcome#index'
end
