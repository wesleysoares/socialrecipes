Rails.application.routes.draw do
  resources :recipes, only: [:new, :create, :show]
  resources :kitchens, only: [:new, :create, :show]
  resources :typefoods, only: [:new, :create, :show]
  resources :foodpreferences, only: [:new, :create, :show]
end
