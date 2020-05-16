Rails.application.routes.draw do

  #devise_for :users
  root "messages#index"
  resources :messages,   only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments,   only: [:create]
  end
  post    '/like/:message_id' => 'likes#like', as: 'like'
  delete  '/like/:message_id' => 'likes#unlike', as: 'unlike'
  get    '/login'   => 'sessions#new'
  post   '/login'   => 'sessions#create'
  delete '/logout'  => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
