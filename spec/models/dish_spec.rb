require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  describe "instance methods" do

    it '#calorie_count' do
      @chef_1 = Chef.create!(name: 'Guy Fieri')

      @dish_1 = @chef_1.dishes.create!(name:"fish-eye pudding", description:"slimey pudding")
      @dish_2 = @chef_1.dishes.create!(name:"stone soup", description:"a classic")

      @ingredient_1 = @dish_1.ingredients.create!(name:"fish eyes", calories:1000)
      @ingredient_2 = @dish_1.ingredients.create!(name:"vanilla pudding", calories:500)
      @ingredient_3 = @dish_2.ingredients.create!(name:"a stone", calories:1)

      expect(@dish_1.calorie_count).to eq(1500)
      expect(@dish_2.calorie_count).to eq(1)
    end

  end
end
