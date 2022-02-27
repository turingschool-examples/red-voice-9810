require 'rails_helper'

RSpec.describe "dish show page", type: :feature do
  it "visits the show page" do
    chef_1 = Chef.create!(name: "Austin")
    chef_2 = Chef.create!(name: "Noel")

    dish_1 = chef_1.dishes.create!(name: "Cereal", description: "Take bowl, pour cereal, pour milk")
    dish_2 = chef_2.dishes.create!(name: "Protein Shake", description: "Pour powder, pour milk")

    visit "/dishes/#{dish_1.id}"

    expect(current_path).to eq("/dishes/#{dish_1.id}")
    expect(current_path).to_not eq("/dishes/#{dish_2.id}")
  end

  it "displays the dish name and description" do
    chef_1 = Chef.create!(name: "Austin")
    chef_2 = Chef.create!(name: "Noel")

    dish_1 = chef_1.dishes.create!(name: "Cereal", description: "Take bowl, pour cereal, pour milk")
    dish_2 = chef_2.dishes.create!(name: "Protein Shake", description: "Pour powder, pour milk")

    visit "/dishes/#{dish_1.id}"

    expect(page).to have_content(dish_1.name)
    expect(page).to have_content(dish_1.description)

    expect(page).to_not have_content(dish_2.name)
    expect(page).to_not have_content(dish_2.description)
  end

  it "lists a dishes ingredients and its chef" do
    chef_1 = Chef.create!(name: "Austin")
    chef_2 = Chef.create!(name: "Noel")

    dish_1 = chef_1.dishes.create!(name: "Cereal", description: "Pour cereal, pour milk")
    dish_2 = chef_2.dishes.create!(name: "Protein Shake", description: "Pour powder, pour milk")

    ingredient_1 = Ingredient.create!(name: "Fruit Loops", calories: 50)
    ingredient_2 = Ingredient.create!(name: "Milk", calories: 100)
    ingredient_3 = Ingredient.create!(name: "Protein Powder", calories: 150)

    dish_ingredient_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    dish_ingredient_2 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
    dish_ingredient_3 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_1.id)
    dish_ingredient_4 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_3.id)

    visit "/dishes/#{dish_1.id}"

    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
    expect(page).to_not have_content(ingredient_3.name)

    expect(page).to have_content(chef_1.name)
    expect(page).to_not have_content(chef_2.name)
  end

  it "displays the total calorie count of the dishes ingredients" do
    chef_1 = Chef.create!(name: "Austin")
    chef_2 = Chef.create!(name: "Noel")

    dish_1 = chef_1.dishes.create!(name: "Cereal", description: "Pour cereal, pour milk")
    dish_2 = chef_2.dishes.create!(name: "Protein Shake", description: "Pour powder, pour milk")

    ingredient_1 = Ingredient.create!(name: "Fruit Loops", calories: 50)
    ingredient_2 = Ingredient.create!(name: "Milk", calories: 100)
    ingredient_3 = Ingredient.create!(name: "Protein Powder", calories: 150)

    dish_ingredient_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    dish_ingredient_2 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
    dish_ingredient_3 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_1.id)
    dish_ingredient_4 = DishIngredient.create!(dish_id: dish_2.id, ingredient_id: ingredient_3.id)

    visit "/dishes/#{dish_1.id}"

    expect(page).to have_content("Total Calories: 150")
    expect(page).to_not have_content("Total Calories: 200")
  end
end

# As a visitor
# When I visit a dish's show page
# I see the total calorie count for that dish.
