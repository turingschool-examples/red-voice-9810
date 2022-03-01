require 'rails_helper'

RSpec.describe 'dish show page' do
  it 'displays the name and description of the dish' do
    chef_1 = Chef.create!(name: "Gordon Ramsey")
    risotto = chef_1.dishes.create!(name: "Risotto", description: "Italian rice dish")

    visit "/dishes/#{risotto.id}"

    expect(page).to have_content(risotto.name)
    expect(page).to have_content(risotto.description)
  end

  it 'displays a list of ingredients and the chef name' do
    chef_1 = Chef.create!(name: "Gordon Ramsey")
    risotto = chef_1.dishes.create!(name: "Risotto", description: "Italian rice dish")
    rice = Ingredient.create!(name: "rice", calories: 300)
    broth = Ingredient.create!(name: "broth", calories: 250)
    butter = Ingredient.create!(name: "butter", calories: 400)

    DishIngredient.create!(dish_id: risotto.id, ingredient_id: rice.id)
    DishIngredient.create!(dish_id: risotto.id, ingredient_id: broth.id)
    DishIngredient.create!(dish_id: risotto.id, ingredient_id: butter.id)

    visit "/dishes/#{risotto.id}"

    expect(page).to have_content(rice.name)
    expect(page).to have_content(broth.name)
    expect(page).to have_content(butter.name)
    expect(page).to have_content(chef_1.name)
  end

  it 'shows the total calorie count for the dish' do
    chef_1 = Chef.create!(name: "Gordon Ramsey")
    risotto = chef_1.dishes.create!(name: "Risotto", description: "Italian rice dish")
    rice = Ingredient.create!(name: "rice", calories: 300)
    broth = Ingredient.create!(name: "broth", calories: 250)
    butter = Ingredient.create!(name: "butter", calories: 400)

    DishIngredient.create!(dish_id: risotto.id, ingredient_id: rice.id)
    DishIngredient.create!(dish_id: risotto.id, ingredient_id: broth.id)
    DishIngredient.create!(dish_id: risotto.id, ingredient_id: butter.id)

    visit "/dishes/#{risotto.id}"

    expect(risotto.calorie_count).to eq(950)
  end
end
