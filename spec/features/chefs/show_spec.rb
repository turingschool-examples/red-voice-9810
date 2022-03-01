require "rails_helper"

RSpec.describe 'chef show page' do
  before :each do
    @chef_1 = Chef.create!(name: 'Guy Fieri')

    @dish_1 = @chef_1.dishes.create!(name:"fish-eye pudding", description:"slimey pudding")
    @dish_2 = @chef_1.dishes.create!(name:"stone soup", description:"a classic")

    @ingredient_1 = @dish_1.ingredients.create!(name:"fish eyes", calories:1000)
    @ingredient_2 = @dish_1.ingredients.create!(name:"vanilla pudding", calories:500)
    @ingredient_3 = @dish_2.ingredients.create!(name:"a stone", calories:1)

    # @dish_ingredient_1 = @dish_1.dish_ingredients.create!(ingredient_id: @ingredient_1.id)
    # @dish_ingredient_2 = @dish_1.dish_ingredients.create!(ingredient_id: @ingredient_2.id)
    # @dish_ingredient_3 = @dish_2.dish_ingredients.create!(ingredient_id: @ingredient_3.id)

    visit "chefs/#{@chef_1.id}"
  end

  it 'shows the chef name' do
    expect(page).to have_content(@chef_1.name)
  end

  it 'shows a link to all ingredients used' do
    expect(page).to have_link("Ingredients Used")
  end

end
