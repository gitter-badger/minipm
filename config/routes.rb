Rails.application.routes.draw do
  root 'projects#index'
  # Resources
  # resources :users
  resources :projects do
    resources :tasks do
      member { put :finish }
    end
  end
end
