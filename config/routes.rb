Rails.application.routes.draw do
  devise_for :users

  resources :songs, only: [:new, :create, :index]

  root 'application#home'
end
