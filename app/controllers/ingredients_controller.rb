class IngredientsController < ApplicationController
  def chef_index
    @chef = Chef.find(params[:id])
    # @ingredients = @chef.get_ingredients
  end
end
