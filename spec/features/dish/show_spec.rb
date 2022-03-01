require 'rails_helper'

RSpec.describe "Dish Show Page" do
  it "should display dish information" do
    chef = Chef.create!(name: "Mario")
    dish = chef.dishes.create!(name: "Fettucine Alfredo", description: "Deliciousness")
    ingredient = Ingredient.create!(name: "Pasta", calories: 300)
    ingredient2 = Ingredient.create!(name: "Alfredo Sauce", calories: 200)
    ingredient3 = Ingredient.create!(name: "Pepper", calories: 10)
    dish_ingredient = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient.id)
    dish_ingredient2 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient2.id)
    dish_ingredient3 = DishIngredient.create!(dish_id: dish.id, ingredient_id: ingredient3.id)
    visit "/dish/#{dish.id}"
    expect(page).to have_content(dish.name)
    expect(page).to have_content(dish.description)
    dish.ingredients.each do |ingredient|
      expect(page).to have_content(ingredient.name)
    end
    expect(page).to have_content(dish.chef.name)
  end
end
