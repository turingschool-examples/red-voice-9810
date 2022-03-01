require 'rails_helper'
# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name

RSpec.describe 'dish show page' do
  it 'can see a list of ingredients for that dish' do
  chef = Chef.create(name: "Gordon Ramsey")
  dish_1 = chef.dishes.create(name: "Roasted beef", description: "hot dish")
  dish_2 = chef.dishes.create(name: "Potatoe Salad", description: "cold dish")

  beef = Ingredient.create(name: 'Beef', calories: 300)
  pepper = Ingredient.create(name: 'Pepper', calories: 30)
  potatoes = Ingredient.create(name: 'Potatoes', calories: 170)

  IngredientDish.create(dish_id: dish_1.id, ingredient_id: beef.id)
  IngredientDish.create(dish_id: dish_1.id, ingredient_id: pepper.id)
  IngredientDish.create(dish_id: dish_2.id, ingredient_id: potatoes.id)

  visit "/dishes/#{dish_1.id}"

  expect(page).to have_content(dish_1.name)
  expect(page).to have_content(dish_1.description)

  end
end
