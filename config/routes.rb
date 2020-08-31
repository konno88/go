Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#home'

  resources :articles do
    resources :comments, only: [:new, :create]

    resource :like, only: [:create, :destroy]
  end

  resource :profile, only: [:show, :edit, :update]

  resources :favorites, only: [:index]
  
  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  resource :followings, only: [:show]

  resource :followers, only: [:show]
end
