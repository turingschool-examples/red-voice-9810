require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end
  describe 'instance methods' do 
    it 'will add an ingredient to a dish' do 
      chef_1 = Chef.create!(name: 'Tom')
      ingredient_1 = Ingredient.create!(name: 'Cheese', calories: 30)
      ingredient_2 = Ingredient.create!(name: 'Linguini', calories: 50)
      dish_1 = Dish.create!(name: 'Pasta', description: 'Mac and Cheese', chef_id: chef_1.id)
      dish_1.add_ingredient(ingredient_1)
      dish_1.add_ingredient(ingredient_2)
      expect(dish_1.ingredients).to eq([ingredient_1, ingredient_2])
    end
  end
end
