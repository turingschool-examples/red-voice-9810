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

    it 'User Story 1 - list name of dish, description, list of ingredients, chef name' do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content(@dish.name)
      expect(page).to have_content(@dish.description)
      expect(page).to have_content(@chef_1.name)
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to have_content(@ingredient_4.name)
    end

    it 'User Story 2 - lists total calorie count' do
      visit "/dishes/#{@dish.id}"

      expect(page).to have_content(@dish.calorie_count)
    end




  end
end
