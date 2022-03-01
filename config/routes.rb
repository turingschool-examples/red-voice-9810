Rails.application.routes.draw do

  get '/dishes/:id', to: 'dishes#show'
  get '/chef/:id', to: 'chef#show'
  get '/chef/:id/ingredients', to: 'ingredients#chef_index'

end
