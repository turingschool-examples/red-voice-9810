require 'rails_helper'

RSpec.describe 'Chef Show Page' do
  before(:each) do
    @sakic = Chef.create!(name: "Sakic")

    @pasta = @sakic.dishes.create!(name: "Pasta", description: "with cream sauce")
    @roast = @sakic.dishes.create!(name: "Pork Roast", description: "with rosemary")

    @noodles = Ingredient.create!(name: 'Noodles', calories: 300)
    @cheese = Ingredient.create!(name: 'Cheese', calories: 200)
    @pepper = Ingredient.create!(name: 'Pepper', calories: 5)
    @pork = Ingredient.create!(name: 'Pork', calories: 50)

    @dish1 = DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @noodles.id )
    @dish2 = DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @cheese.id )
    @dish3 = DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @pepper.id )
    @dish4 = DishIngredient.create!(dish_id: @roast.id, ingredient_id: @noodles.id )
    @dish5 = DishIngredient.create!(dish_id: @roast.id, ingredient_id: @cheese.id )
    @dish6 = DishIngredient.create!(dish_id: @roast.id, ingredient_id: @pork.id )
  end

  describe 'When I visit a chefs show page' do
    it 'displays the name of the chef' do
      visit chef_path(@sakic)
        expect(current_path).to eq(chef_path(@sakic))

        expect(page).to have_content(@sakic.name)
      end
    end
    it 'has a link to see all ingredients the chef uses' do
      visit chef_path(@sakic)

      expect(current_path).to eq(chef_path(@sakic))

      click_link "Chefs Ingredients"

      expect(current_path).to eq(chef_ingredients_path(@sakic))
    end
end
