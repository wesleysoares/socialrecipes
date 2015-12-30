Rails.application.routes.draw do

  devise_for :users
  root 'recipes#index'
  resources :recipes, only: [:new, :create, :show]
  resources :kitchens, only: [:new, :create, :show]
  resources :type_foods, only: [:new, :create, :show]
  resources :food_preferences, only: [:new, :create, :show]
end
