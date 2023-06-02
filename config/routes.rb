Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'folllowings' => 'relationships#followings', as: 'followings'
    get 'folllowers' => 'relationships#followers', as: 'followers'
    get 'search' => 'users#search'
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show]
  get 'search' => 'searches#search'
end
