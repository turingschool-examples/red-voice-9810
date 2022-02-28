require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end
  it 'will return the 3 most popular ingredients that a chef uses' do 
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
    # Cheese:3, Linguini: 1, Tomato: 2, Milk: 2
    expect(chef_1.most_popular_ingredients).to eq(['Cheese', 'Tomato', 'Milk'])
  end
end
