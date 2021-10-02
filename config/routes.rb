Rails.application.routes.draw do
  get 'transactions/index'
  get 'transactions/show'
  get 'transactions/new'
  get 'transactions/create'
  devise_for :users
  root to: 'pages#home'

  resources :transactions, only: [:index, :new, :create, :update, :show ]

  resources :passports, only: [:index, :new, :create, :update, :show ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
