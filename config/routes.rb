Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :notebooks do
        resources :notes, module: :notebooks
      end
    end
  end

  resources :app, only: :index

  root to: 'welcome#index'
end
