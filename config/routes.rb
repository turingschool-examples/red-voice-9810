Rails.application.routes.draw do

  resources :chefs do
      resources :ingredients
    end 
  resources :dishes


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
