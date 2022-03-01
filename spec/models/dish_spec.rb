require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  describe "class methods" do
    it "::total_calories" do
      chef = Chef.create!(name: "me")
      dish = chef.dishes.create!(name: "Butter Soup", description: "This sounds terrible")
      ing_1 = dish.ingredients.create!(name: "Butter", calories: 200)
      ing_2 = dish.ingredients.create!(name: "Thyme", calories: 15)

      expect(dish.total_calories).to eq(215)
    end
  end
end
