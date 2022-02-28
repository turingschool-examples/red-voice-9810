require 'rails_helper'

RSpec.describe 'Chef' do
  describe 'show page' do
    before :each do
      @chef_1 = Chef.create!(name: "Nick Smith")
      @dish_1 = Dish.create!(name: "Eggs Benedict", description: "Eggs on eggs on ham on bread" , chef_id: @chef_1.id)
      @dish_2 = Dish.create!(name: "Cake", description: "mmmmm cake" , chef_id: @chef_1.id)

      @ingredient_1 = Ingredient.create!(name: "Eggs", calories: 100)
      @ingredient_2 = Ingredient.create!(name: "Hollandaise", calories: 300)
      @ingredient_3 = Ingredient.create!(name: "Ham", calories: 200)
      @ingredient_4 = Ingredient.create!(name: "English Muffin", calories: 100)
      @ingredient_5 = Ingredient.create!(name: "Flour", calories: 100)
      @ingredient_6 = Ingredient.create!(name: "SPAM", calories: 100)

      @recipe_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
      @recipe_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
      @recipe_3 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)
      @recipe_4 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_4.id)
      @recipe_5 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_5.id)
      @recipe_6 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_1.id)
    end

    # As a visitor
    # When I visit a chef's show page
    # I see the name of that chef
    # And I see a link to view a list of all ingredients that this chef uses in their dishes
    it 'User Story 3.1 - see the name and link to ingredient list' do
      visit "/chefs/#{@chef_1.id}"

      expect(page).to have_content(@chef_1.name)
      expect(page).to have_link("Ingredient List")
    end

    # When I click on that link
    # I'm taken to a chef's ingredient index page
    # and I can see a unique list of names of all the ingredients that this chef uses
    it 'User Story 3.2 - see the name and link to ingredient list' do
    end
  end
end
