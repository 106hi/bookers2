Rails.application.routes.draw do
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as:'about'
  devise_for :users
  resources :users, only: [:index, :show, :edit]
  resources :books, only: [:index, :show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
