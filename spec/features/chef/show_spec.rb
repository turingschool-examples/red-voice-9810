require 'rails_helper'

RSpec.describe "Chef Show Page" do

  before(:each) do
    @chef = Chef.create!(name: "Mario")
    @chef2 = Chef.create!(name: "Luigi")
    @dish = @chef.dishes.create!(name: "Fettucine Alfredo", description: "Deliciousness")
    @dish2 = @chef2.dishes.create!(name: "Pizza", description: "Mama Mia")

    @ingredient = Ingredient.create!(name: "Pasta", calories: 300)
    @ingredient2 = Ingredient.create!(name: "Alfredo Sauce", calories: 200)
    @ingredient3 = Ingredient.create!(name: "Pepper", calories: 10)

    @ingredient4 = Ingredient.create!(name: "Dough", calories: 400)
    @ingredient5 = Ingredient.create!(name: "Tomato Sauce", calories: 50)
    @ingredient6 = Ingredient.create!(name: "Cheese", calories: 70)

    @dish_ingredient = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient.id)
    @dish_ingredient2 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient2.id)
    @dish_ingredient3 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient3.id)

    @dish_ingredient4 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient4.id)
    @dish_ingredient5 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient5.id)
    @dish_ingredient7 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient6.id)
  end

  it "should display chef information" do
    visit "/chef/#{@chef.id}"

    expect(page).to have_content(@chef.name)
    expect(page).to_not have_content(@chef2.name)

    click_on("Ingredients")

    expect(current_path).to eq("/chef/#{@chef.id}/ingredients")

    @chef.ingredients.each do |ingredient|
      expect(page).to have_content(ingredient.name)
    end

    @chef2.ingredients.each do |ingredient|
      expect(page).to_not have_content(ingredient.name)
    end
  end

end
