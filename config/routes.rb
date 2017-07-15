Rails.application.routes.draw do
  root "home#index"

  resources :companies do
    resources :jobs do
      resources :comments, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  resources :categories

end
