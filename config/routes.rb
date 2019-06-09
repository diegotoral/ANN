Rails.application.routes.draw do
  devise_for :users

  resources :app, only: :index

  root to: 'welcome#index'
end
