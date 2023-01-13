Rails.application.routes.draw do
  resources :products
  devise_for :users
  root "main#index"

  resources :cart, only: [:index] do
    member do
      post 'add', to: 'cart#add'
      patch 'add', to: 'cart#add'
      patch 'finish', to: 'cart#finish'
    end
  end
end
