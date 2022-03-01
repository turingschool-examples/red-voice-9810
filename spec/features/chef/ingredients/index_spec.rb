require 'rails_helper'

RSpec.describe "Chefs show page" do
  before(:each) do
    @chef = Chef.create!(name: "Cheffy")
    @chef2 = Chef.create!(name: "Chef Jr.")
    @dish1 = @chef.dishes.create!(name: "Da_dish", description: "Dishy")
    @dish2 = @chef.dishes.create!(name: "Yum Yum", description: "Yummy")
    @dish3 = @chef2.dishes.create!(name: "carmel", description: "sweeet")
    @ingredient1 = Ingredient.create!(name: "flour", calories: 364)
    @ingredient2 = Ingredient.create!(name: "butter", calories: 128)
    @ingredient3 = Ingredient.create!(name: "sugar", calories: 228)
    @dish_ingredient1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ingredient2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    @dish_ingredient3 = DishIngredient.create!(dish_id: @dish3.id, ingredient_id: @ingredient3.id)
  end

  it "has the names of its chefs ingredients" do
    visit chef_ingredients_path(@chef)
    save_and_open_page
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to_not have_content(@ingredient3.name)
  end

end
