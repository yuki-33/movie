Rails.application.routes.draw do
  get 'directors/show'
  get 'works/show'
  root to: 'home#index'
  get 'home/index'

  resources :works
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
