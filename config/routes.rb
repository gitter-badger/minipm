Rails.application.routes.draw do
  # Root path
  root 'projects#index'

  # Resources
  resources :projects do
    resources :tasks do
      member do
        put :finish
        put :cancel
      end
    end
  end

  # Users and sessions
  resources :users
  # resources :user_sessions

  # User session
  post   'login'  => 'user_sessions#create'
  get    'login'  => 'user_sessions#new'
  delete 'logout' => 'user_sessions#destroy'
end
