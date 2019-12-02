Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :members 
  resources :favorites, only: [:index, :destroy] do 
    member do
      post "add", to: "favorites#create"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :posts, only: [:index]
  resources :comments do
    resources :likes, only: [:create, :destroy]
  end
  

  root to: 'posts#index'
  
end
