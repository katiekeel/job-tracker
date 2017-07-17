Rails.application.routes.draw do
  root "home#index"

  resources :companies do
    resources :jobs do
      resources :comments, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :contacts, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :categories

  resources :jobs, only: [:index]

  resources :dashboard, only: [:index]

end
