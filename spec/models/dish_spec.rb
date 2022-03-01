require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:dish_ingredients)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods:" do

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
    end

    it 'calorie_count' do
      expect(@dish_1.calorie_count).to eq(790)
      expect(@dish_2.calorie_count).to eq(250)
    end

    xit 'get_ingredients' do

    end
  end
end
