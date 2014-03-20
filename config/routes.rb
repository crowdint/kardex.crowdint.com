Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    resources :events, only: [ :index, :create, :update, :destroy ]
    resources :attendances, only: [ :index, :create, :show ]
  end
end
