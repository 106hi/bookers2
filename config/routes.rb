Rails.application.routes.draw do
  root to: 'home#top'
  get 'home/about' => 'home#about', as:'about'
  devise_for :users
  resources :users, only: [:index, :show, :create, :edit, :update]
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#guest_sign_in'
  end
end
