Rails.application.routes.draw do
  get 'comments/create'

  get 'comments/destroy'

  post 'likes/id' => "likes#toggle"

  devise_for :users
  resources :posts, only: [:index, :create, :destroy]
  resources :comments, only: [:create, :destroy]
  #resources :likes, only: [:create, :destroy]
  
  
  root "posts#index"
end
