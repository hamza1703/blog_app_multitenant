Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => {:registrations => "users/registrations", sessions: 'users/sessions'}

  get '/home/index', to: "home#index"

  get '/home/get_companies', to: "home#show"

  get 'welcome/index'

  root 'welcome#index'




end
