require "rails_helper"

RSpec.describe 'Dishes show page' do
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
  end

  it "shows dish's name, description, list of ingredients, and chef's name" do

    visit "dishes/#{@dish_1.id}"
    expect(page).to have_content(@dish_1.name)
    expect(page).to have_content(@dish_1.description)
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to_not have_content(@dish_2.name)
    expect(page).to_not have_content(@ingredient_3.name)
    expect(page).to have_content('Guy Fieri')
  end

  it "shows calorie count for that dish" do
    visit "dishes/#{@dish_1.id}"
    expect(page).to have_content("Total Calories:1500")
  end
end
