require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end



  describe "instance methods" do

    before(:each) do
      @chef = Chef.create!(name: "Cheffy")
      @dish1 = @chef.dishes.create!(name: "Da_dish", description: "Dishy")
      @dish2 = @chef.dishes.create!(name: "Yum Yum", description: "Yummy")
      @ingredient1 = Ingredient.create!(name: "flour", calories: 3)
      @ingredient2 = Ingredient.create!(name: "butter", calories: 128)
      @dish_ingredient1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
      @dish_ingredient2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
    end

    describe ".chef_name" do
      it "returns the chefs name that the dish belongs to" do
        expect(@dish1.chef_name).to eq(@chef.name)
      end
    end

    describe ".calorie_count" do
      it "returns number of calories from all ingredients in dish" do
        expect(@dish1.calorie_count).to eq(131)  
      end
    end
  end
end
