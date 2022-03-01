require 'rails_helper'

RSpec.describe 'the dish show page: ', type: :feature do
  describe 'US1: ' do

    before :each do
      @chef_1 = Chef.create(name: 'Jeff')
      @dish_1 = chef_1.dishes.create(name: 'Chicken & Waffles', description: 'just like it says')
      @dish_2 = chef_1.dishes.create(name: 'Pork Chops', description: 'grilled pork chop')
      @ingredient_1 = Ingredient.create(name: 'fried chicken', calories: 540)
      @ingredient_2 = Ingredient.create(name: 'butter', calories: 40)
      @ingredient_3 = Ingredient.create(name: 'egg', calories: 200)
      @ingredient_4 = Ingredient.create(name: 'flour', calories: 10)
      @ingredient_5 = Ingredient.create(name: 'cheese', calories: 250)
      DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
      DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
      DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)
      DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_4.id)
      DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_5.id )
      visit "/dishes/#{@dish_1.id}"
    end

    it 'has the dishs name & description' do
      expect(page).to have_content(@dish_1.name)
      expect(page).to have_content(@dish_1.description)
    end

    it 'has all the ingredients in the dish & none that arent' do
      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
      expect(page).to have_content(@ingredient_4.name)

      expect(page).to_not have_content(@ingredient_5.name)
    end

    it 'has the chefs name' do
      expect(page).to have_content(@chef_1.name)
    end

    describe 'US2: ' do
      it 'has a total calorie count' do
        expect(page).to have_content("Total Calorie Count: #{@dish_1.calorie_count}")
      end
    end
  end
end
