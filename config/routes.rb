Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :regions, only: [:index, :new, :create]

  root "regions#index"
end
