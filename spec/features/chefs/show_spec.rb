require 'rails_helper'

RSpec.describe 'Chefs Show Page' do
  before :each do
    @chef_1 = Chef.create!(name: "Gordan Ramsey")
    @dish_1 = @chef_1.dishes.create!(name: "Beef Welington", description: "Giant wrapped beef in dough")
    @ingredient_1 = @dish_1.ingredients.create!(name: "Beef", calories: 500)
    @ingredient_2 = @dish_1.ingredients.create!(name: "Dough", calories: 192)
    @dish_2 = @chef_1.dishes.create!(name: "Scrambled Eggs", description: "Perfectly Scrambled Eggs")
    @ingredient_3 = @dish_2.ingredients.create!(name: "Eggs", calories: 200)
    @ingredient_4 = @dish_2.ingredients.create!(name: "Butter", calories: 69)
  end

  it "shows chefs name and has a link to all their ingredients" do
    visit "/chefs/#{@chef_1.id}"

    expect(page).to have_content("#{@chef_1.name}")
    expect(page).to have_link("All Ingredients #{@chef_1.name} Used:")
  end

  it "Link goes to chefs ingredients index page that shows ingredients" do
    visit "/chefs/#{@chef_1.id}"

    click_link("All Ingredients #{@chef_1.name} Used:")

    expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")

    expect(page).to have_content("#{@ingredient_1.name}")
    expect(page).to have_content("#{@ingredient_2.name}")
    expect(page).to have_content("#{@ingredient_3.name}")
    expect(page).to have_content("#{@ingredient_4.name}")
  end
end
