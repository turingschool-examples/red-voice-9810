require 'rails_helper'

RSpec.describe 'Dish Show page' do

    before :each do
      @chef1 = Chef.create!(name: 'Cooker')
      @chili = Dish.create!(name: 'chili', description: 'very spicy', chef_id: @chef1.id)

      @sugar = Ingredient.create!(name: 'sugar', calories: 25)
      @salt = Ingredient.create!(name: 'salt', calories: 7)
      @lime = Ingredient.create!(name: 'lime', calories: 43)
      @beans = Ingredient.create!(name: 'beans', calories: 11)
      @jalps = Ingredient.create!(name: 'jalps', calories: 71)
      @flour = Ingredient.create!(name: 'flour', calories: 1)
      @apples = Ingredient.create!(name: 'apples', calories: 22)
      @bread = Ingredient.create!(name: 'bread', calories: 8)
      @eggs = Ingredient.create!(name: 'eggs', calories: 43)
      @chips = Ingredient.create!(name: 'chips', calories: 11)
      @something_special = Ingredient.create!(name: 'something_special', calories: 1)

      DishIngredient.create!(ingredient_id: @sugar.id, dish_id: @chili.id)
      DishIngredient.create!(ingredient_id: @apples.id, dish_id: @chili.id)
      DishIngredient.create!(ingredient_id: @beans.id, dish_id: @chili.id)
      DishIngredient.create!(ingredient_id: @bread.id, dish_id: @chili.id)

    end
    # require "pry"; binding.pry
    describe "will show a dish's attributes" do
    it 'will list' do
      visit dish_path(@chili.id)

     expect(page).to have_content(@chili.name)
     expect(page).to have_content(@chili.description)
     expect(page).to have_content(@chef1.name)

     within('#ingredient-0') do
       expect(page).to have_content(@sugar.name)
     end

     within('#ingredient-1') do
       expect(page).to have_content(@beans.name)
     end

     within('#ingredient-2') do
       expect(page).to have_content(@apples.name)
     end

     within('#ingredient-3') do
       expect(page).to have_content(@bread.name)
     end
   end
 end
end
