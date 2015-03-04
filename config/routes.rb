Rails.application.routes.draw do
  devise_for :users

  resources :songs, only: [:new, :create, :index] do
    post :veto

    resources :votes, only: [:create]
  end

  # post '/songs/:id/veto' => 'songs#veto'

  root 'songs#index'
end
