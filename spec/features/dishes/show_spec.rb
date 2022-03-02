require 'rails_helper'

# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name

RSpec.describe 'Dish Show Page' do
  it 'displays dish name and description' do
    chef = Chef.create(name: "Gaston Acurio")
    dish_1 = chef.dishes.create(name: "Ceviche", description: "Entree")
    dish_2 = chef.dishes.create(name: "Lomo Saltado", description: "Main dish")

    salt = Ingredient.create(name: 'Salt', calories: 70)
    pepper = Ingredient.create(name: 'Pepper', calories: 30)
    potatoes = Ingredient.create(name: 'Potatoes', calories: 170)

    IngredientDish.create(dish_id: dish_1.id, ingredient_id: salt.id)
    IngredientDish.create(dish_id: dish_1.id, ingredient_id: pepper.id)
    IngredientDish.create(dish_id: dish_2.id, ingredient_id: potatoes.id)

    visit "dishes/#{dish_1.id}"

    expect(page).to have_content(dish_1.name)
    expect(page).to have_content(dish_1.description)
    expect(page).to have_content(dish_1.list_ingredients)
    expect(page).to have_content(dish_1.chef_name)
    expect(page).to have_content(dish_1.calories_count)
  end
end
