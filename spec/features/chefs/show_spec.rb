require 'rails_helper'

RSpec.describe 'Chef Show page' do

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

    describe "will show a chef's attributes" do
    it 'will list' do
      visit chef_path(@chef1.id)

    expect(page).to have_link("My unique ingredients")
    click_link("My unique ingredients")

    expect(page).to have_current_path(chef_ingredients_path(@chef1.id))

      expect(page).to have_content(@sugar.name)
      expect(page).to have_content(@apples.name)
      expect(page).to have_content(@beans.name)
      expect(page).to have_content(@bread.name)
   end
 end
end
