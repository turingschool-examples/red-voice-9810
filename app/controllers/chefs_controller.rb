class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
    @ingredients = @chef.ingredient_list

  end
end
