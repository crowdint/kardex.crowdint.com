Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    resources :events, only: [ :index, :create, :update, :destroy ]
  end
end
