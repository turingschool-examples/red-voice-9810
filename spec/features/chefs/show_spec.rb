require 'rails_helper'

# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses

RSpec.describe "chef show page", type: :feature do
  it "visits the show page and sees the chef's name" do
    chef_1 = Chef.create!(name: "Austin")
    chef_2 = Chef.create!(name: "Noel")
    visit "/chefs/#{chef_1.id}"

    expect(current_path).to eq("/chefs/#{chef_1.id}")
    expect(current_path).to_not eq("/chefs/#{chef_2.id}")

    expect(page).to have_content(chef_1.name)
    expect(page).to_not have_content(chef_2.name)
  end

  it "lists the ingredients of all their dishes as links" do
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

    visit "/chefs/#{chef_1.id}"

    expect(page).to have_link(ingredient_1.name)
    expect(page).to have_link(ingredient_2.name)
    expect(page).to_not have_link(ingredient_3.name)
    expect(page).to have_link(ingredient_4.name)
    expect(page).to have_link(ingredient_5.name)
    expect(page).to have_link(ingredient_6.name)
  end
end
