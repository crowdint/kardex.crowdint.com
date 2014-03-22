Kardex::Engine.routes.draw do
  namespace :api do
    resources :events, only: [ :index, :create, :update, :destroy ]
    resources :attendances, only: [ :index, :create, :show ]
  end
end
