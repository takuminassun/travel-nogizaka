Rails.application.routes.draw do
  devise_for :users
  
  resources :users, only: [:index, :show] 
  resources :members ,only: [:index, :show]
  resources :favorites, only: [:index, :destroy] do
    member do
      post "add", to: "favorites#create"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :posts, only: [:index]
  resources :comments do
    collection do
      get "search"
    end
    resources :likes, only: [:create, :destroy]
  end
  resources :search, only: [:index]
  root to: 'posts#index'

  get 'getstarted', to: 'posts#getstarted'
  
end
