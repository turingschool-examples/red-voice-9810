require 'rails_helper'

RSpec.describe 'the chef show page: ', type: :feature do
  describe 'US3: ' do
    before :each do
      @chef_1 = Chef.create(name: 'Jeff')
      @chef_2 = Chef.create(name: 'Chet')

      @dish_1 = @chef_1.dishes.create(name: 'Chicken & Waffles', description: 'just like it says')
      @dish_2 = @chef_1.dishes.create(name: 'Pork Chops', description: 'grilled pork chop')
      @dish_3 = @chef_1.dishes.create(name: 'Casserole', description: 'tuna lasagna casserole')

      @dish_4 = @chef_2.dishes.create(name: 'Hot Dogs', description: 'kosher beef in a bun')

      @ingredient_1 = Ingredient.create(name: 'fried chicken', calories: 540)
      @ingredient_2 = Ingredient.create(name: 'butter', calories: 40)
      @ingredient_3 = Ingredient.create(name: 'egg', calories: 200)
      @ingredient_4 = Ingredient.create(name: 'flour', calories: 10)
      @ingredient_5 = Ingredient.create(name: 'cheese', calories: 250)
      @ingredient_6 = Ingredient.create(name: 'milk', calories: 100)
      @ingredient_7 = Ingredient.create(name: 'pork slab', calories: 666)
      @ingredient_8 = Ingredient.create(name: 'beef cylinder', calories: 420)
      @ingredient_9 = Ingredient.create(name: 'peanut butter', calories: 150)
      @ingredient_10 = Ingredient.create(name: 'jelly', calories: 140)
      @ingredient_11 = Ingredient.create(name: 'salt', calories: 0)
      @ingredient_12 = Ingredient.create(name: 'noodles', calories: 333)

      DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id )
      DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id )
      DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id )
      DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_4.id )

      DishIngredient.create(dish_id: @dish_4.id, ingredient_id: @ingredient_3.id )
      DishIngredient.create(dish_id: @dish_4.id, ingredient_id: @ingredient_4.id )
      DishIngredient.create(dish_id: @dish_4.id, ingredient_id: @ingredient_8.id )
      DishIngredient.create(dish_id: @dish_4.id, ingredient_id: @ingredient_11.id )

      DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_2.id )
      DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id )
      DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_7.id )
      DishIngredient.create(dish_id: @dish_2.id, ingredient_id: @ingredient_11.id )

      DishIngredient.create(dish_id: @dish_3.id, ingredient_id: @ingredient_2.id )
      DishIngredient.create(dish_id: @dish_3.id, ingredient_id: @ingredient_5.id )
      DishIngredient.create(dish_id: @dish_3.id, ingredient_id: @ingredient_6.id )
      DishIngredient.create(dish_id: @dish_3.id, ingredient_id: @ingredient_7.id )
      DishIngredient.create(dish_id: @dish_3.id, ingredient_id: @ingredient_11.id )
      DishIngredient.create(dish_id: @dish_3.id, ingredient_id: @ingredient_12.id )

      visit "/chefs/#{@chef_1.id}"
    end

    it 'has the chefs name' do
      expect(page).to have_content(@chef_1.name)
    end

    it 'has a link to the chefs ingredients page' do
      click_on("Explore #{@chef_1.name}'s Ingredients")
      expect(current_path).to eq "/chef/#{@chef_1.id}/ingredients"
    end
  end
end
