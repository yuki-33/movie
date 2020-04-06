Rails.application.routes.draw do
  devise_for :users
  root to: 'works#index'
  get 'home/index'
  resources :directors
  resources :works, only: [:index, :show] do
    get 'higher' => 'works#move_higher', as: 'higher', on: :member
  end
  resources :tags, only: [:show]
  namespace :login do
    resources :works, only: [:new, :create, :edit, :update, :destroy]
    resources :directors, only: [:new, :create, :edit, :update, :destroy]
    resource :profile, only: [:create, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
