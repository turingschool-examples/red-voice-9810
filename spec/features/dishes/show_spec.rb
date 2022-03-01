require 'rails_helper'

RSpec.describe "Dishes show page" do
  before(:each) do
    @chef = Chef.create!(name: "Cheffy")
    @dish1 = @chef.dishes.create!(name: "Da_dish", description: "Dishy")
    @dish2 = @chef.dishes.create!(name: "Yum Yum", description: "Yummy")
    @ingredient1 = Ingredient.create!(name: "flour", calories: 364)
    @ingredient2 = Ingredient.create!(name: "butter", calories: 128)
    @dish_ingredient1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
    @dish_ingredient2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
  end

  it "has the dishes name and description" do
    visit dish_path(@dish1)

    expect(page).to have_content(@dish1.name)
    expect(page).to have_content(@dish1.description)
    expect(page).to_not have_content(@dish2.description)
  end

  it "lists the ingredients names for the dish" do
    visit dish_path(@dish1)

    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
  end

  it "has the chefs name that the dish belongs to" do
    visit dish_path(@dish1)

    expect(page).to have_content(@chef.name)
  end
end
