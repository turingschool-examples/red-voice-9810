require 'rails_helper'

RSpec.describe "Chefs show page" do
  before(:each) do
    @chef = Chef.create!(name: "Cheffy")
    @chef2 = Chef.create!(name: "Chef Jr.")
    @dish1 = @chef.dishes.create!(name: "Da_dish", description: "Dishy")
    @dish2 = @chef.dishes.create!(name: "Yum Yum", description: "Yummy")
    @dish3 = @chef2.dishes.create!(name: "carmel", description: "sweeet")
    @dish4 = @chef.dishes.create!(name: "cookies", description: "sweeet")
    @ingredient1 = Ingredient.create!(name: "flour", calories: 364)
    @ingredient2 = Ingredient.create!(name: "butter", calories: 128)
    @ingredient3 = Ingredient.create!(name: "sugar", calories: 228)
    @ingredient3 = Ingredient.create!(name: "chocolate chips", calories: 128)
    @dish_ingredient1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ingredient2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    @dish_ingredient3 = DishIngredient.create!(dish_id: @dish3.id, ingredient_id: @ingredient3.id)
    @dish_ingredient4 = DishIngredient.create!(dish_id: @dish4.id, ingredient_id: @ingredient1.id)
    @dish_ingredient5 = DishIngredient.create!(dish_id: @dish4.id, ingredient_id: @ingredient2.id)
    @dish_ingredient6 = DishIngredient.create!(dish_id: @dish4.id, ingredient_id: @ingredient3.id)
    @dish_ingredient6 = DishIngredient.create!(dish_id: @dish4.id, ingredient_id: @ingredient4.id)
    @dish_ingredient7 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient2.id)
  end

  it "has the chefs name" do
    visit chef_path(@chef)

    expect(page).to have_content(@chef.name)
    expect(page).to_not have_content(@chef2.name)
  end

  it "has a link to chefs ingredients index page" do
    visit chef_path(@chef)
    click_on 'Ingredients'
    expect(current_path).to eq(chef_ingredients_path(@chef))
  end

  it "shows the chefs 3 most popular ingredients" do
    visit chef_path(@chef)

    expect(page).to have_content(@chef.popular_ingredients)
    expect(page).to_not have_content(@chef2.popular_ingredients)
  end
end
