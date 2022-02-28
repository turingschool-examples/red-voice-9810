# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name

require 'rails_helper'

RSpec.describe 'Dish' do
  describe 'show page' do
    before :each do
      @chef_1 = Chef.create!(name: "Nick Smith")
      @dish = Dish.create!(name: "Eggs Benedict", description: "Eggs on eggs on ham on bread" , chef_id: @chef_1.id)

      @ingredient_1 = Ingredient.create!(name: "Eggs", calories: 100)
      @ingredient_2 = Ingredient.create!(name: "Hollandaise", calories: 300)
      @ingredient_3 = Ingredient.create!(name: "Ham", calories: 200)
      @ingredient_4 = Ingredient.create!(name: "English Muffin", calories: 100)

      @recipe_1 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient_1.id)
      @recipe_2 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient_2.id)
      @recipe_3 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient_3.id)
      @recipe_4 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient_4.id)
    end

    it 'list name of dish, description, list of ingredients, chef name' do
      visit "/dish/#{@dish.id}"

      expect(page).to have_content(@dish.name)
      expect(page).to have_content(@dish.description)
      expect(page).to have_content(@chef_1.name)
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to have_content(@ingredient_4.name)
    end
  end
end
