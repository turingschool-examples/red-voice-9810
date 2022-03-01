require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before(:each) do
    @chef = Chef.create!(name: "Gordon Ramsay")
    @dish = @chef.dishes.create!(name: "Clam Chowder", description: "Plain Old Clam Chowder")
    @ingredient_1 = Ingredient.create!(name: "Cream")
    @ingredient_2 = Ingredient.create!(name: "Potato")
    @ingredient_3 = Ingredient.create!(name: "Onion")

    @chef_two = Chef.create!(name: "Ruben Pasillas")
    @dish_two = @chef.dishes.create!(name: "Quiche", description: "Decent Quiche.")
    @ingredient_4 = Ingredient.create!(name: "Egg")
    @ingredient_5 = Ingredient.create!(name: "Cheese")
    @ingredient_6 = Ingredient.create!(name: "Bacon")

  end

  it 'Displays dish name and description' do
    visit "/dishes/#{@dish.id}"

    expect(page).to have_content(@dish.name)
    expect(page).to have_content(@dish.description)
    expect(page).to_not have_content(@dish_two.name)
    expect(page).to_not have_content(@dish_two.description)

    visit "/dishes/#{@dish_two.id}"

    expect(page).to have_content(@dish_two.name)
    expect(page).to have_content(@dish_two.description)
    expect(page).to_not have_content(@dish.name)
    expect(page).to_not have_content(@dish.description)
  end

  it 'Displays Dish Chef' do
    visit "/dishes/#{@dish.id}"
    expect(page).to have_content(@chef.name)
    expect(page).to_not have_content(@chef_two.name)

    visit "/dishes/#{@dish_two.id}"
    expect(page).to have_content(@chef_two.name)
    expect(page).to_not have_content(@chef.name)
  end

  it 'Displays Dish Ingredients' do
    visit "/dishes/#{@dish.id}"
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_3.name)
    expect(page).to_not have_content(@ingredient_4.name)
    expect(page).to_not have_content(@ingredient_5.name)
    expect(page).to_not have_content(@ingredient_6.name)



    visit "/dishes/#{@dish_two.id}"
    expect(page).to have_content(@ingredient_4.name)
    expect(page).to have_content(@ingredient_5.name)
    expect(page).to have_content(@ingredient_6.name)
    expect(page).to_not have_content(@ingredient_1.name)
    expect(page).to_not have_content(@ingredient_2.name)
    expect(page).to_not have_content(@ingredient_3.name)
  end
end
