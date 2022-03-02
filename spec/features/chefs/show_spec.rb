require 'rails_helper'

RSpec.describe 'chefs show page' do
  describe 'User Story #3' do
    before(:each) do
      @ramsay = Chef.create!(name: "Gordon Ramsay")
      # @michael = Chef.create!(name: "Michael")

      @wellington = @ramsay.dishes.create!(name: "Beef Wellington", description: "Beef Wellington is a steak dish of English origin, made out of fillet steak coated with pâté and duxelles, wrapped in puff pastry, then baked.")
      # @scrambies = @michael.dishes.create!(name: "Scrambled Eggs", description: "World Famous Eggs!")

      @ingredient_1 = Ingredient.create!(name: "puff pastry", calories: 1200)
      @ingredient_2 = Ingredient.create!(name: "filet tenderloin", calories: 2000)
      @ingredient_3 = Ingredient.create!(name: "mushrooms", calories: 350)
      @ingredient_4 = Ingredient.create!(name: "rosemary", calories: 10)

      DishIngredient.create!(dish: @wellington, ingredient: @ingredient_1)
      DishIngredient.create!(dish: @wellington, ingredient: @ingredient_2)
      DishIngredient.create!(dish: @wellington, ingredient: @ingredient_3)
      DishIngredient.create!(dish: @wellington, ingredient: @ingredient_4)

      visit "/chefs/#{@ramsay.id}"
    end

    it "shows the name of the chef" do

      expect(page).to have_content(@ramsay.name)
    end

    it "displays a link to view all ingredients the chef uses in their dishes" do
      # save_and_open_page
      expect(page).to have_link("Click here to see the ingredients")

      click_link "Click here to see the ingredients"

      expect(current_path).to eq("/chefs/#{@ramsay.id}/ingredients")
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_4.name)
    end
  end

end
