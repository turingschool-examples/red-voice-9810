require 'rails_helper'

# As a visitor
# When I visit a dish's show page
# I see the dish’s name and description
# And I see a list of ingredients for that dish
# And I see the chef's name

RSpec.describe 'Dish Show Page' do
  before(:each) do
    @gunnar = Chef.create!(name: "Gunnar")
    @sakic = Chef.create!(name: "Sakic")

    @pasta = @gunnar.dishes.create!(name: "Pasta", description: "with cream sauce")
    @roast = @gunnar.dishes.create!(name: "Pork Roast", description: "with rosemary")


  end

  describe 'Story 1 -shows dish name, description, ingredients and chefs name' do
    it 'shows dish name & description' do
      visit dish_path(@pasta)
      expect(current_path).to eq(dish_path(@pasta))

      within "div.dish" do
        expect(page).to have_content(@pasta.name)
        expect(page).to have_content(@pasta.description)
        expect(page).to_not have_content(@roast.name)
      end
    end
  end
end
