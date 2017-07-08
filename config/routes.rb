Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/damedog_admin', as: 'rails_admin'
  resources :pages, only: [:show]
  root to: 'pages#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
