require 'rails_helper'

RSpec.describe 'Show page' do
  it 'shows a unique list of items used by a specific chef' do
    chef = Chef.create!(name: 'King Chef')
    dish1 = chef.dishes.create!(name: 'King Krabé', description: 'Only food a king can eat')
    ingredient1 = dish1.ingredients.create!(name: 'Crab', calories: 20)
    ingredient2 = dish1.ingredients.create!(name: 'King butter', calories: 100)
    ingredient3 = dish1.ingredients.create!(name: 'Gold', calories: 0)
    dish2 = chef.dishes.create!(name: 'Peasant Cheese', description: 'not great')
    ingredient4 = dish2.ingredients.create!(name: 'Cheese', calories: 100)
    ingredient5 = dish2.ingredients.create!(name: 'Gold', calories: 0)

    visit "/chefs/#{chef.id}/ingredients"

    expect(page).to have_content(ingredient1.name)
    expect(page).to have_content(ingredient2.name)
    expect(page).to have_content(ingredient3.name)
    expect(page).to have_content(ingredient4.name)
  end
end
