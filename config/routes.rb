Rails.application.routes.draw do

  resources :chefs, only: [:show] do
    resources :ingredients, controller: 'chef_ingredients', only: [:index]
  end
  resources :dishes, only: [:show]
end
