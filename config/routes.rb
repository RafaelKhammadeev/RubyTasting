Rails.application.routes.draw do
  root to: 'states#index'
  # resource :users, only: %i[new create]
  resources :states
end
