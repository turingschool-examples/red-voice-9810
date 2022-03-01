require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'instance methods' do
    it "can return a unique list of all ingredients used by the chef" do
      chef = Chef.create!(name: "Chef Paul")
      dish1 = chef.dishes.create!(name: "Tuna Salad", description: "Tuna by Paul")
      ingredient1 = dish1.ingredients.create!(name: "Tuna", calories: 100 )
      ingredient2 = dish1.ingredients.create!(name: "Celery", calories: 10 )
      ingredient3 = dish1.ingredients.create!(name: "Mayo", calories: 1000 )
      dish2 = chef.dishes.create!(name: "Chicken Salad", description: "Chicken by Paul")
      ingredient4 = dish2.ingredients.create!(name: "Chicken", calories: 100 )
      ingredient5 = dish2.ingredients.create!(name: "Grapes", calories: 100 )
      ingredient6 = dish2.ingredients.create!(name: "Mayo", calories: 1000 )

      expect(chef.all_ingredients).to eq([ingredient2.name, ingredient4.name, ingredient5.name, ingredient3.name, ingredient1.name, ])
    end
  end
end
