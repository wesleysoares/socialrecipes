Rails.application.routes.draw do

  devise_for :users

  root 'recipes#index'

  get '/profile/:id/recipes', to: "recipes#recipes_user", as: 'recipes_profile'

  resources :recipes, only: [:new, :create, :show]
  resources :kitchens, only: [:new, :create, :show]
  resources :type_foods, only: [:new, :create, :show]
  resources :food_preferences, only: [:new, :create, :show]
end
