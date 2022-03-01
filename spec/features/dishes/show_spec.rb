require 'rails_helper'

describe 'dish show page' do
  it 'displays chef name and ingredients list' do
    chef1 = Chef.create!(name: "Chef Boyardee")
    cheese_grits = chef1.dishes.create!(name: "Cheesy grits", description: "savory comfort food")

    cheese = cheese_grits.ingredients.create!(name: "cheddar cheese", energy: 100)
    chicken = cheese_grits.ingredients.create!(name: "chicken broth", energy: 10)
    grits = cheese_grits.ingredients.create!(name: "grits", energy: 100)


    visit "/chefs/#{chef1.id}/dishes/#{cheese_grits.id}"

    expect(page).to have_content(cheese_grits.name)
    expect(page).to have_content(cheese_grits.description)
    expect(page).to have_content(cheese.name)
    expect(page).to have_content(chicken.name)
    expect(page).to have_content(grits.name)

    expect(page).to have_content(cheese_grits.total_energy)
  end
end
