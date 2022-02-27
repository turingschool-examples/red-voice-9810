Rails.application.routes.draw do
  resources :dishes, only:[:show]
  resources :chefs, only:[:show]
  get '/chefs/:id/ingredients', to: "chef_ingredient#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
