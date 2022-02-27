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

  describe 'instance methods' do
    it "calculates the sum of all a dishes ingredients calories" do
      chef_1 = Chef.create!(name: "Austin")
      dish_1 = chef_1.dishes.create!(name: "Cereal", description: "Pour cereal, pour milk")
      ingredient_1 = Ingredient.create!(name: "Fruit Loops", calories: 50)
      ingredient_2 = Ingredient.create!(name: "Milk", calories: 100)
      dish_ingredient_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
      dish_ingredient_2 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)

      expect(dish_1.total_calories).to eq(150)
    end
  end
end
