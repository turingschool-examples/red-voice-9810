require 'rails_helper'

RSpec.describe 'Show page' do
  it 'I see the name of the dish, the description, a list of ingredients, and the chefs name' do
    chef = Chef.create!(name: 'King Chef')
    dish1 = chef.dishes.create!(name: 'King Krabé', description: 'Only food a king can eat')
    ingredient1 = dish1.ingredients.create!(name: 'Crab', calories: 20)
    ingredient2 = dish1.ingredients.create!(name: 'King Butter', calories: 100)
    ingredient3 = dish1.ingredients.create!(name: 'Gold', calories: 0)

    visit "/dishes/#{dish1.id}"

    expect(page).to have_content(chef.name)
    expect(page).to have_content(dish1.name)
    expect(page).to have_content(dish1.description)
    expect(page).to have_content(ingredient1.name)
    expect(page).to have_content(ingredient2.name)
    expect(page).to have_content(ingredient3.name)
  end

  it 'shows the total calorie count for a dish' do
    chef = Chef.create!(name: 'King Chef')
    dish1 = chef.dishes.create!(name: 'King Krabé', description: 'Only food a king can eat')
    ingredient1 = dish1.ingredients.create!(name: 'Crab', calories: 20)
    ingredient2 = dish1.ingredients.create!(name: 'King Butter', calories: 100)
    ingredient3 = dish1.ingredients.create!(name: 'Gold', calories: 0)

    visit "/dishes/#{dish1.id}"

    expect(page).to have_content('Total Calorie Count: 120')
  end
end
