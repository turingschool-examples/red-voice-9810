require 'rails_helper'

RSpec.describe 'chef show page' do
  it 'displays the name of the chef' do
    chef_1 = Chef.create!(name: "Gordon Ramsey")
    chef_2 = Chef.create!(name: "Wolfgang Puck")

    visit "/chefs/#{chef_1.id}"

    expect(page).to have_content(chef_1.name)
    expect(page).to_not have_content(chef_2.name)

    visit "/chefs/#{chef_2.id}"

    expect(page).to have_content(chef_2.name)
    expect(page).to_not have_content(chef_1.name)
  end

  it 'has a link to view all ingredients the chef uses' do
    chef_1 = Chef.create!(name: "Gordon Ramsey")

    visit "/chefs/#{chef_1.id}"

    expect(page).to have_link("All ingredients")

    click_link("All ingredients")

    expect(current_path).to eq("/chefs/#{chef_1.id}/ingredients")
  end

  it 'shows a unique list of names of all ingredients the chef uses' do
    chef_1 = Chef.create!(name: "Gordon Ramsey")
    risotto = chef_1.dishes.create!(name: "Risotto", description: "Italian rice dish")
    scallops = chef_1.dishes.create!(name: "Scallops", description: "Crispy and pan seared")
    rice = Ingredient.create!(name: "rice", calories: 300)
    broth = Ingredient.create!(name: "broth", calories: 250)
    butter = Ingredient.create!(name: "butter", calories: 400)

    DishIngredient.create!(dish_id: risotto.id, ingredient_id: rice.id)
    DishIngredient.create!(dish_id: risotto.id, ingredient_id: broth.id)
    DishIngredient.create!(dish_id: risotto.id, ingredient_id: butter.id)
    DishIngredient.create!(dish_id: scallops.id, ingredient_id: butter.id)

    visit "/chefs/#{chef_1.id}/ingredients"
# require "pry"; binding.pry
    expect(page).to have_content(rice.name)
    expect(page).to have_content(broth.name)
    expect(page).to have_content(butter.name)
  end
end
