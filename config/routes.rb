Rails.application.routes.draw do
  resources :students, only: [:index, :show, :create, :update, :destroy]
  resources :instructors, only: [:index, :show, :create, :update, :destroy]
end
