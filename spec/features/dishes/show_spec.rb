require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before(:each) do
    @chef = Chef.create!(name: "Gordon Ramsay")
    @dish = @chef.dishes.create!(name: "Clam Chowder", description: "Plain Old Clam Chowder")
    @ingredient_1 = @dish.ingredients.create!(name: "Cream", calories: 100)
    @ingredient_2 = @dish.ingredients.create!(name: "Potato", calories: 50)
    @ingredient_3 = @dish.ingredients.create!(name: "Onion", calories: 25)

    @chef_two = Chef.create!(name: "Ruben Pasillas")
    @dish_two = @chef_two.dishes.create!(name: "Quiche", description: "Decent Quiche.")
    @ingredient_4 = @dish_two.ingredients.create!(name: "Egg", calories: 60)
    @ingredient_5 = @dish_two.ingredients.create!(name: "Cheese", calories: 120)
    @ingredient_6 = @dish_two.ingredients.create!(name: "Bacon", calories: 80)

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

  it 'Displays Calorie Count' do
    visit "/dishes/#{@dish.id}"
    expect(page).to have_content(@dish.total_calories)
    expect(page).to_not have_content(@dish_two.total_calories)

    visit "/dishes/#{@dish_two.id}"
    expect(page).to have_content(@dish_two.total_calories)
    expect(page).to_not have_content(@dish.total_calories)
  end
end
