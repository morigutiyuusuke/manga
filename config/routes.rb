Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  resources :comics, only: [:index,:show,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
  resources :comic_comments, only: [:create, :destroy]
end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
end
    get 'search', to: 'searches#search', as: 'search'
end
