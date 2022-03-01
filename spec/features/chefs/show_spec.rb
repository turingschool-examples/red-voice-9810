require 'rails_helper'

describe 'chef show page' do
  it 'has a link to view chefs ingredients index with unique ingredients' do
    chef1 = Chef.create!(name: "Chef")

    # alfredo and mac and cheese both have pasta and cheese
    alfredo = chef1.dishes.create!(name: "fettuccine alfredo", description: "Al dente pasta in a savory cream sauce")

    cheese = alfredo.ingredients.create!(name: "cheese", energy: 100)
    pasta = alfredo.ingredients.create!(name: "pasta", energy: 400)
    garlic = alfredo.ingredients.create!(name: "garlic", energy: 5)
    cream = alfredo.ingredients.create!(name: "heavy cream", energy: 500)

    mac_and_cheese = chef1.dishes.create!(name: "mac and cheese", description: "cheesy mac and cheese cooked to perfection")

    cheese = mac_and_cheese.ingredients.create!(name: "cheese", energy: 100)
    pasta = mac_and_cheese.ingredients.create!(name: "pasta", energy: 400)
    chicken = mac_and_cheese.ingredients.create!(name: "chicken broth", energy: 10)
    bacon = mac_and_cheese.ingredients.create!(name: "bacon sprinkles", energy: 200)

    visit "/chefs/#{chef1.id}"

    expect(page).to have_content(chef1.name)

    click_link("View this chefs ingredients cupboard")

    expect(current_path).to eq("/chefs/#{chef1.id}/ingredients")

    expect(page).to have_content(cheese.name, count: 1)
    expect(page).to have_content(pasta.name, count: 1)
    expect(page).to have_content(garlic.name)
    expect(page).to have_content(cream.name)
    expect(page).to have_content(chicken.name)
    expect(page).to have_content(bacon.name)
  end
end
