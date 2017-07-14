Rails.application.routes.draw do
  root "home#index"

  resources :companies do
    resources :jobs
  end

  resources :categories

end
