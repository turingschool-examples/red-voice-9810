Rails.application.routes.draw do

  get '/chefs/:chef_id/dishes/:dish_id', to: 'dishes#show'
end
