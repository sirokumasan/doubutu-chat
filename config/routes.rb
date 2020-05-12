Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :messages,   only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments,   only: [:create]
  end
  post    '/like/:messge_id' => 'likes#like', as: 'like'
  delete  '/like/:message_id' => 'likes#unlike', as: 'unlike'
end
