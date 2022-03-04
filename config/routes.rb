# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  resources :members
  
  resources :articles do
    resources :comments
  end

  get '/home/index', to: 'home#index'

  get '/home/get_companies', to: 'home#show'

  get 'welcome/index'

  root 'welcome#index'
end
