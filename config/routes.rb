Rails.application.routes.draw do

  get     'auth/:provider/callback', to: 'sessions#create'
  get     'auth/failure',            to: redirect('/')

  resources :sessions, only: [:new, :create, :destroy]

  resources :calendars

  root to: 'sessions#new'
end
