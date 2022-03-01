require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before(:each) do
    @gunnar = Chef.create!(name: "Gunnar")
    @sakic = Chef.create!(name: "Sakic")

    @pasta = @gunnar.dishes.create!(name: "Pasta", description: "with cream sauce")
    @roast = @gunnar.dishes.create!(name: "Pork Roast", description: "with rosemary")

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

  describe 'US1 -shows dish name, description, ingredients and chefs name' do
    it 'shows dish name & description' do
      visit dish_path(@pasta)
      expect(current_path).to eq(dish_path(@pasta))

      within "div.dish" do
        expect(page).to have_content(@pasta.name)
        expect(page).to have_content(@pasta.description)
        expect(page).to_not have_content(@roast.name)
      end
    end
    it 'shows ingredient list' do
      visit dish_path(@pasta)
      expect(current_path).to eq(dish_path(@pasta))

      within "div.ingredients" do
        expect(page).to have_content(@noodles.name)
        expect(page).to have_content(@cheese.name)
        expect(page).to have_content(@pepper.name)
        expect(page).to_not have_content(@pork.name)
      end
    end
    it 'shows chef name' do
      visit dish_path(@pasta)
      expect(current_path).to eq(dish_path(@pasta))

      within "div.chef" do
        expect(page).to have_content(@gunnar.name)
        expect(page).to_not have_content(@sakic.name)
      end
    end
  end
  describe "When I visit a dish's show page I see the total calorie count for that dish." do
    it 'shows total calorie count' do
      visit dish_path(@pasta)

      within "div.calories" do
        expect(page).to have_content("Total Calories: 505")
      end
    end
  end
end
