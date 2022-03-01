Rails.application.routes.draw do

  resources :chefs, only: [:show]
  resources :dishes, only: [:show]
end
