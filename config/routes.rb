Rails.application.routes.draw do
  root to: "products#index"
  devise_for :users
  resources :products, only: [:new, :create]
end
