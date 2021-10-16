Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get "donneespersonnelles", to: 'pages#persospecs', as: 'persospecs'
  get "mentionslegales", to: 'pages#legalspecs', as: 'legalspecs'
  get "gestiondescookies", to: 'pages#cookiesspecs', as: 'cookiesspecs'

  
  get "dashboard", to: 'pages#dashboard'
  get "search", to: 'pages#search'
  resources :transactions, only: [:update, :show]

  resources :passports, only: [:index, :new, :create, :update, :show ] do
    resources :transactions, only: [:new, :create]
    resources :reviews, only: [:new, :create]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
