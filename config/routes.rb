Rails.application.routes.draw do
  get '/chefs/:chef_id/dishes/:dish_id', to: 'dishes#show'

  get '/chefs/:id', to: 'chefs#show'

  get '/chefs/:id/ingredients', to: 'chefs#index'
end
