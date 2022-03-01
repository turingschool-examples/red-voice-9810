require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before :each do
    @chef_1 = Chef.create!(name: "Gordan Ramsey")
    @dish_1 = @chef_1.dishes.create!(name: "Beef Welington", description: "Giant wrapped beef")
    @ingredient_1 = @dish_1.ingredients.create!(name: "Beef")
    @ingredient_2 = @dish_1.ingredients.create!(name: "Dough")
  end

  it "shows dishes attributes" do
    visit "/dishes/#{@dish_1.id}"

    expect(page).to have_content("#{@dish_1.name}")
    expect(page).to have_content("#{@dish_1.description}")

    expect(page).to have_content("#{@ingredient_1.name}")
    expect(page).to have_content("#{@ingredient_2.name}")

    expect(page).to have_content("#{@chef_1.name}")
  end
end
