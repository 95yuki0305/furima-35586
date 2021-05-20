Rails.application.routes.draw do
  root to: "products#index"
  devise_for :users
  resources :products do
    resources :orders, only: [:index, :create]
  end
end