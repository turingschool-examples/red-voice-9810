require 'rails_helper'

RSpec.describe 'Chef Ingredients Index Page' do
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

  describe 'When I visit a chefs ingredients index page' do
    it 'displays all of the ingredients that chef uses' do
      visit chef_ingredients_path(@sakic.id)
      expect(current_path).to eq(chef_ingredients_path(@sakic.id))

      within "div.ingredients" do
        expect(page).to have_content(@noodles.name)
        expect(page).to have_content(@cheese.name)
        expect(page).to have_content(@pepper.name)
        expect(page).to have_content(@pork.name)
      end
    end
  end
end
