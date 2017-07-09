Rails.application.routes.draw do
  devise_for :admins
  devise_scope :admin do
  put 'admins' => 'devise/registrations#update', as: 'admin_registration'
  get 'admins/edit' => 'devise/registrations#edit', as: 'edit_admin_registration'
  delete 'admins' => 'devise/registrations#destroy', as: 'registration'
end
  mount RailsAdmin::Engine => '/damedog_admin', as: 'rails_admin'
  resources :pages, only: [:show]
  root to: 'pages#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
