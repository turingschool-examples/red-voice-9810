require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before(:each) do
    @chef_greg = Chef.create!(name: "Greg")
    @chef_laura = Chef.create!(name: "Laura")

    @tacos = @chef_greg.dishes.create!(name: "Tacos", description: "For Tuesdays")
    @enchiladas = @chef_greg.dishes.create!(name: "Enchilidas", description: "Friday Special")

    @tortilla = Ingredient.create!(name: 'Tortilla', calories: 150)
    @cheese = Ingredient.create!(name: 'Cheese', calories: 200)
    @lettuce = Ingredient.create!(name: 'Lettuce', calories: 5)
    @sauce = Ingredient.create!(name: 'Enchilida Sauce', calories: 50)

    @dish_ing_1 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @tortilla.id )
    @dish_ing_2 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @cheese.id )
    @dish_ing_3 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @lettuce.id )
    @dish_ing_4 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @tortilla.id )
    @dish_ing_5 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @cheese.id )
    @dish_ing_6 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @sauce.id )
  end

  describe 'Story 1' do
    describe 'shows dish name, description, ingredients and chefs name' do
      it 'shows dish name & description' do
        visit dish_path(@tacos)
        expect(current_path).to eq(dish_path(@tacos))

        within "div.dish" do
          expect(page).to have_content(@tacos.name)
          expect(page).to have_content(@tacos.description)
          expect(page).to_not have_content(@enchiladas.name)
        end
      end

      it 'shows ingredient list' do
        visit dish_path(@tacos)
        expect(current_path).to eq(dish_path(@tacos))

        within "div.ingredients" do
          expect(page).to have_content(@tortilla.name)
          expect(page).to have_content(@cheese.name)
          expect(page).to have_content(@lettuce.name)
          expect(page).to_not have_content(@sauce.name)
        end
      end

      it 'shows chef name' do
        visit dish_path(@tacos)
        expect(current_path).to eq(dish_path(@tacos))

        within "div.chef" do
          expect(page).to have_content(@chef_greg.name)
          expect(page).to_not have_content(@chef_laura.name)
        end
      end
    end
  end

  describe 'Story 2' do
    describe 'Dish show page shows total calories for that dish' do
      it 'shows calorie count' do
        visit dish_path(@tacos)
        expect(current_path).to eq(dish_path(@tacos))

        within "div.calories" do
          expect(page).to have_content(@tacos.calorie_count)
        end
      end
    end
  end
end
