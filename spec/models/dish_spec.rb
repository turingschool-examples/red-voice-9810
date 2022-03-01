require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many(:dish_ingredients) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance methods' do
    it "can count all the calories in a dish" do
      chef = Chef.create!(name: "Chef Paul")
      dish1 = chef.dishes.create!(name: "Tuna Salad", description: "Tuna by Paul")
      ingredient1 = dish1.ingredients.create!(name: "Tuna", calories: 100 )
      ingredient2 = dish1.ingredients.create!(name: "Celery", calories: 10 )
      ingredient3 = dish1.ingredients.create!(name: "Mayo", calories: 1000 )

      expect(dish1.calorie_count).to eq(1110)
    end
  end
end
