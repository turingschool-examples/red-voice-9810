require 'rails_helper'

RSpec.describe "chef ingredients index page", type: :feature do
  it "visits the chef's ingredients index page and sees all its ingredients" do
    chef_1 = Chef.create!(name: "Austin")
    chef_2 = Chef.create!(name: "Noel")

    dish_1 = chef_1.dishes.create!(name: "Cereal", description: "Pour cereal, pour milk")
    dish_2 = chef_2.dishes.create!(name: "Protein Shake", description: "Pour powder, pour milk")
    dish_3 = chef_1.dishes.create!(name: "Toast", description: "Toast bread, spread jam")
    dish_4 = chef_1.dishes.create!(name: "Cookies and Milk", description: "Eat cookies, drink milk")

    ingredient_1 = Ingredient.create!(name: "Fruit Loops", calories: 50)
    ingredient_2 = Ingredient.create!(name: "Milk", calories: 100)
    ingredient_3 = Ingredient.create!(name: "Protein Powder", calories: 150)
    ingredient_4 = Ingredient.create!(name: "Bread", calories: 200)
    ingredient_5 = Ingredient.create!(name: "Jam", calories: 250)
    ingredient_6 = Ingredient.create!(name: "Cookies", calories: 300)

    dish_ingredient_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    dish_ingredient_2 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
    dish_ingredient_3 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_2.id)
    dish_ingredient_4 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_3.id)
    dish_ingredient_5 = DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_4.id)
    dish_ingredient_6 = DishIngredient.create!(dish_id: dish_3.id, ingredient_id: ingredient_5.id)
    dish_ingredient_7 = DishIngredient.create!(dish_id: dish_4.id, ingredient_id: ingredient_2.id)
    dish_ingredient_8 = DishIngredient.create!(dish_id: dish_4.id, ingredient_id: ingredient_6.id)

    visit "/chefs/#{chef_1.id}/ingredients"

    expect(current_path).to eq("/chefs/#{chef_1.id}/ingredients")

    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
    expect(page).to_not have_content(ingredient_3.name)
    expect(page).to have_content(ingredient_4.name)
    expect(page).to have_content(ingredient_5.name)
    expect(page).to have_content(ingredient_6.name)
  end
end
