Rails.application.routes.draw do
  root to: 'states#index'
  resources :users, only: %i[new create]
  resources :states
end
