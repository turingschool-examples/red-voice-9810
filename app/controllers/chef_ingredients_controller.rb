class ChefIngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    @ingredients = @chef.ingredient_list
  end
end
