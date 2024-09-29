Rails.application.routes.draw do
  resources requests:, only: [:index, :new, :create]
  devise_for :users
  root to: "requests#index"
end