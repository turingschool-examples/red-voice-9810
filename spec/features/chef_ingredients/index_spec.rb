require 'rails_helper'

RSpec.describe 'chef ingredients index' do
    before(:each) do
        @chef_1 = Chef.create!(name: "Emeril")
        @chef_2 = Chef.create!(name: "Bobby Flay")
        @dish_1 = Dish.create!(name: "Tacos", description: "Meat and deliciousness with tortillas", chef_id: @chef_1.id)
        @dish_2 = Dish.create!(name: "Fried Pickles", description: "Pickles... Fried.", chef_id: @chef_1.id)
        @dish_3 = Dish.create!(name: "Ramen", description: "Adult soup", chef_id: @chef_1.id)
        @dish_4 = Dish.create!(name: "Spaghetti", description: "Long noodles with meat sauce", chef_id: @chef_2.id)
        @dish_5 = Dish.create!(name: "Ravioli", description: "Delicious noodle pockets in sauce filled with meat", chef_id: @chef_2.id)
        @dish_6 = Dish.create!(name: "BBQ", description: "Slowly smoked meat that will make you miss summers on the patio", chef_id: @chef_2.id)
        @ingredient_1 = Ingredient.create!(name: "Carnitas", calories: 220)
        @ingredient_2 = Ingredient.create!(name: "Tortilla", calories: 150)
        @ingredient_3 = Ingredient.create!(name: "Cheese", calories: 300)
        @ingredient_4 = Ingredient.create!(name: "Pickle", calories: 50)
        @ingredient_5 = Ingredient.create!(name: "Noodle", calories: 250)
        @ingredient_6 = Ingredient.create!(name: "Brisket", calories: 310)
        @ingredient_7 = Ingredient.create!(name: "Pasta Sauce", calories: 200)
        @dish_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
        @dish_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
        @dish_ingredient_3 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)
        @dish_ingredient_4 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id)
        @dish_ingredient_5 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_5.id)
        @dish_ingredient_6 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_5.id)
        @dish_ingredient_7 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_7.id)
        @dish_ingredient_8 = DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @ingredient_5.id)
        @dish_ingredient_9 = DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @ingredient_7.id)
        @dish_ingredient_10 = DishIngredient.create!(dish_id: @dish_6.id, ingredient_id: @ingredient_1.id)
        @dish_ingredient_11 = DishIngredient.create!(dish_id: @dish_6.id, ingredient_id: @ingredient_6.id)
        @dish_ingredient_12 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_3.id)
        @dish_ingredient_13 = DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @ingredient_3.id)
    end

    it 'has all ingredient names and calorie count for each ingredient used by chef' do 
        visit "/chefs/#{@chef_1.id}/ingredients/"

        expect(page).to have_content("#{@chef_1.name}'s Ingredients")

        within "#ingredients" do 
            expect(page).to have_content(@ingredient_1.name)
            expect(page).to have_content(@ingredient_2.name)
            expect(page).to have_content(@ingredient_3.name)
            expect(page).to have_content(@ingredient_4.name)
            expect(page).to have_content(@ingredient_5.name)
            expect(page).to_not have_content(@ingredient_6.name)
            expect(page).to_not have_content(@ingredient_7.name)
        end
    end
end
