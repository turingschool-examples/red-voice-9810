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

    # do not display other chefs things
    unrelated_chef = Chef.create!(name: "Unrelated chef")
    dust = unrelated_chef.dishes.create!(name: "dust", description: "Anybody? No? DUST.")
    dust_food = dust.ingredients.create!(name: "LITERALLY JUST DUST", energy: 0)

    visit "/chefs/#{chef1.id}"

    expect(page).to have_content(chef1.name)

    click_link("View this chefs ingredients cupboard")

    expect(current_path).to eq("/chefs/#{chef1.id}/ingredients")

    # it does not show ingredients of other chefs
    expect(page).not_to have_content(dust.name)
    expect(page).to have_content(cheese.name, count: 1)
    expect(page).to have_content(pasta.name, count: 1)
    expect(page).to have_content(garlic.name)
    expect(page).to have_content(cream.name)
    expect(page).to have_content(chicken.name)
    expect(page).to have_content(bacon.name)
  end

  xit 'top 3 ingredients' do
    chef1 = Chef.create!(name: "Chef")

    # cheese is used in 4 dishes, pasta in 3, and garlic in 2.
    pasta_dish = chef1.dishes.create!(name: "pasta and garlic", description: "tasty, anti vampire.")

    pasta = pasta_dish.ingredients.create!(name: "pasta", energy: 400)
    garlic = pasta_dish.ingredients.create!(name: "garlic", energy: 5)

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

    cheese_grits = chef1.dishes.create!(name: "Cheesy grits", description: "Savory creamy comfort food")

    cheese = cheese_grits.ingredients.create!(name: "cheese", energy: 100)
    grits = cheese_grits.ingredients.create!(name: "grits", energy: 100)

    cheese_sticks = chef1.dishes.create!(name: "Mozzeralla cheese sticks", description: "Fried cheese.")

    cheese = cheese_sticks.ingredients.create!(name: "cheese", energy: 100)
    crumbs = cheese_sticks.ingredients.create!(name: "bread crumbs", energy: 500)

    visit "/chefs/#{chef1.id}"

    within("#top-3") do
      expect(cheese.name).to apear_before(pasta.name)
      expect(pasta.name).to appear_before(garlic.name)
    end
  end
end
