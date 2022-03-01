class ChefIngredientsController < ApplicationController
    def index
        @chef = Chef.find(params[:id])
        @ingredients = @chef.ingredient_list
    end
end