Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  
  get "dashboard", to: 'pages#dashboard'

  resources :transactions, only: [:update, :show]

  resources :passports, only: [:index, :new, :create, :update, :show ] do
    resources :transactions, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
