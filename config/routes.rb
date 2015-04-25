Rails.application.routes.draw do
  root 'projects#index'
  # Resources
  # resources :users
  resources :projects
end
