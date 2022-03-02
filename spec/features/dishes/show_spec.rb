require 'rails_helper'

RSpec.describe 'dish show page' do
  describe 'User Story #1 and #2' do
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
    end

    it "shows the dish name, description, the list of ingredients and chef's name" do
      visit "/dishes/#{@wellington.id}"

      expect(page).to have_content(@wellington.name)
      expect(page).to have_content(@wellington.description)
      expect(page).to have_content(@ramsay.name)
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to have_content(@ingredient_4.name)
    end

    it "shows the total calorie count for a specific dish" do
      visit "/dishes/#{@wellington.id}"

      expect(page).to have_content(@wellington.total_calorie_count)
    end
  end

end
