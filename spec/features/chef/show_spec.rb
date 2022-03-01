require 'rails_helper'
# Story 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses

RSpec.describe 'chef show page' do
  it 'can see a link to view a list of all ingredients that this chef uses in their dishes' do
    chef = Chef.create(name: "Gordon Ramsey")
    chef_2 = Chef.create(name: "Uncle Roger")
    dish_1 = chef.dishes.create(name: "Roasted beef", description: "hot dish")
    dish_2 = chef.dishes.create(name: "Potatoe Salad", description: "cold dish")
    dish_3 = chef_2.dishes.create(name: "Tacos", description: "entree")

    beef = Ingredient.create(name: 'Beef', calories: 300)
    pepper = Ingredient.create(name: 'Pepper', calories: 30)
    potatoes = Ingredient.create(name: 'Potatoes', calories: 170)
    tortillas = Ingredient.create(name: 'Tortillas', calories: 100)

    IngredientDish.create(dish_id: dish_1.id, ingredient_id: beef.id)
    IngredientDish.create(dish_id: dish_1.id, ingredient_id: pepper.id)
    IngredientDish.create(dish_id: dish_2.id, ingredient_id: potatoes.id)
    IngredientDish.create(dish_id: dish_3.id, ingredient_id: tortillas.id)

    visit "/chefs/#{chef.id}"
    expect(page).to have_content(chef.name)
    expect(page).to have_link("List of all ingredients")
    click_link "List of all ingredients"
    expect(current_path).to eq("/chefs/#{chef.id}/ingredients")
    expect(page).to have_content(beef.name)
    expect(page).to have_content(pepper.name)
    expect(page).to have_content(potatoes.name)
    expect(page).to_not have_content(tortillas.name)
    # expect(page).to have_content(chef.ingredients_list)
  end
end
