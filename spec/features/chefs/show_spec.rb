require 'rails_helper'

# Story 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses

RSpec.describe 'Chef Show Page' do
  it 'displays chef name and link to ingredient list' do
    chef = Chef.create(name: "Gaston Acurio")
    dish_1 = chef.dishes.create(name: "Ceviche", description: "Entree")
    dish_2 = chef.dishes.create(name: "Lomo Saltado", description: "Main dish")

    salt = Ingredient.create(name: 'Salt', calories: 70)
    pepper = Ingredient.create(name: 'Pepper', calories: 30)
    potatoes = Ingredient.create(name: 'Potatoes', calories: 170)

    IngredientDish.create(dish_id: dish_1.id, ingredient_id: salt.id)
    IngredientDish.create(dish_id: dish_1.id, ingredient_id: pepper.id)
    IngredientDish.create(dish_id: dish_2.id, ingredient_id: potatoes.id)

    visit "/chefs/#{chef.id}"

    expect(page).to have_content(chef.name)
    expect(page).to have_link("Ingredient List")
  end

  it 'displays chef name and link to ingredient list' do
    chef = Chef.create(name: "Gaston Acurio")
    dish_1 = chef.dishes.create(name: "Ceviche", description: "Entree")
    dish_2 = chef.dishes.create(name: "Lomo Saltado", description: "Main dish")

    salt = Ingredient.create(name: 'Salt', calories: 70)
    pepper = Ingredient.create(name: 'Pepper', calories: 30)
    potatoes = Ingredient.create(name: 'Potatoes', calories: 170)

    IngredientDish.create(dish_id: dish_1.id, ingredient_id: salt.id)
    IngredientDish.create(dish_id: dish_1.id, ingredient_id: pepper.id)
    IngredientDish.create(dish_id: dish_2.id, ingredient_id: potatoes.id)

    visit "/chefs/#{chef.id}"
    click_link "Ingredient List"

    expect(current_path).to eq("/chefs/#{chef.id}/ingredients")
    expect(page).to have_content(salt.name)
    expect(page).to have_content(pepper.name)
    expect(page).to have_content(potatoes.name)
  end
end
