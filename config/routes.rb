Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :posts, only: [:index]
  resources :comments, only: [:index, :new, :create, :show, :destory, :edit] do
    resources :likes, only: [:create, :destroy]
  end

  root to: 'posts#index'
  
end
