require 'rails_helper'

RSpec.describe 'Ingredients Spec' do 
    before :each do 
        @chef_1 = Chef.create!(name: 'Tom')
        @ingredient_1 = Ingredient.create!(name: 'Cheese', calories: 30)
        @ingredient_2 = Ingredient.create!(name: 'Linguini', calories: 50)
        @dish_1 = Dish.create!(name: 'Pasta', description: 'Mac and Cheese', chef_id: @chef_1.id)
        @dish_1.add_ingredient(@ingredient_1)
        @dish_1.add_ingredient(@ingredient_2)
    end
    it 'will show a list of the ingredients' do 
        chef_1 = Chef.create!(name: 'Tom')
        ingredient_1 = Ingredient.create!(name: 'Cheese', calories: 30)
        ingredient_2 = Ingredient.create!(name: 'Linguini', calories: 50)
        ingredient_3 = Ingredient.create!(name: 'Tomato', calories: 80)
        ingredient_4 = Ingredient.create!(name: 'Milk', calories: 40)
        dish_1 = Dish.create!(name: 'Pasta', description: 'Mac and Cheese', chef_id: chef_1.id)
        dish_1.add_ingredient(ingredient_1)
        dish_1.add_ingredient(ingredient_2)
        dish_1.add_ingredient(ingredient_4)
        dish_2 = Dish.create!(name: 'Pizza', description: 'Delicious!', chef_id: chef_1.id)
        dish_2.add_ingredient(ingredient_1)
        dish_2.add_ingredient(ingredient_3)
        dish_3 = Dish.create!(name: 'Tomato Cheese Cake', description: 'Desert', chef_id: chef_1.id)
        dish_3.add_ingredient(ingredient_1)
        dish_3.add_ingredient(ingredient_3)
        dish_3.add_ingredient(ingredient_4)

        visit "/chefs/#{chef_1.id}/ingredients"
        save_and_open_page
        expect(page).to have_content(chef_1.most_popular_ingredients)
    end

end