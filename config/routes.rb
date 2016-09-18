Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admins do
    resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :orders, only: [:index, :edit, :update, :destroy]
  end

  resources :bills, only: [:index, :show, :create, :new]
  resources :cart_items, only: [:index, :create, :destroy]
  resources :products, only: [:index, :show]
end
