require 'rails_helper'

RSpec.describe 'Chef Show Page' do
  before(:each) do
    @chef_laura = Chef.create!(name: "Laura")

    @tacos = @chef_laura.dishes.create!(name: "Tacos", description: "For Tuesdays")
    @enchiladas = @chef_laura.dishes.create!(name: "Enchilidas", description: "Friday Special")

    @tortilla = Ingredient.create!(name: 'Tortilla', calories: 150)
    @cheese = Ingredient.create!(name: 'Cheese', calories: 200)
    @lettuce = Ingredient.create!(name: 'Lettuce', calories: 5)
    @sauce = Ingredient.create!(name: 'Enchilida Sauce', calories: 50)
    @carnitas = Ingredient.create!(name: 'Carnitas', calories: 300)

    @dish_ing_1 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @tortilla.id )
    @dish_ing_2 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @cheese.id )
    @dish_ing_3 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @lettuce.id )
    @dish_ing_3 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @carnitas.id )
    @dish_ing_4 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @tortilla.id )
    @dish_ing_5 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @cheese.id )
    @dish_ing_6 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @carnitas.id )
    @dish_ing_6 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @sauce.id )
  end

  describe 'Story 3' do
    describe 'shows chef name and links to all chefs ingredients' do
      it 'shows chef name' do
        visit chef_path(@chef_laura)
        expect(current_path).to eq(chef_path(@chef_laura))

        expect(page).to have_content(@chef_laura.name)
      end

      it 'links to ingredient list' do
        visit chef_path(@chef_laura)
        expect(current_path).to eq(chef_path(@chef_laura))

        expect(page).to have_link("See #{@chef_laura.name}'s Ingredients")

        click_on "See #{@chef_laura.name}'s Ingredients"
        expect(current_path).to eq(chef_ingredients_path(@chef_laura))
      end

      it 'ingredient list page has all ingredients chef uses' do
        visit chef_ingredients_path(@chef_laura)
        expect(current_path).to eq(chef_ingredients_path(@chef_laura))

        expect(page).to have_content(@tortilla.name)
        expect(page).to have_content(@cheese.name)
        expect(page).to have_content(@lettuce.name)
        expect(page).to have_content(@sauce.name)
        expect(page).to have_content(@carnitas.name)
      end
    end
  end

  describe 'Extension' do
    describe 'shows 3 most popular ingredients based on most used' do
      it 'shows most popular ingredients' do
        visit chef_path(@chef_laura)
        expect(current_path).to eq(chef_path(@chef_laura))

        within "div.popular" do
          expect(page).to have_content("Most Popular Ingredients")
          expect(page).to have_content(@tortilla.name)
          expect(page).to have_content(@cheese.name)
          expect(page).to have_content(@carnitas.name)
        end
      end
    end
  end
end
