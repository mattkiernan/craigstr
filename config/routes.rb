Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  resources :regions do
    resources :categories, only: [:new, :create, :show]
  end
  root "regions#index"
end
