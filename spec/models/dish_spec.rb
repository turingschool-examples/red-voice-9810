require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe "instance methods" do
    before(:each) do
      @ramsay = Chef.create!(name: "Gordon Ramsay")
      # @michael = Chef.create!(name: "Michael")

      @wellington = @ramsay.dishes.create!(name: "Beef Wellington", description: "Beef Wellington is a steak dish of English origin, made out of fillet steak coated with pâté and duxelles, wrapped in puff pastry, then baked.")
      # @scrambies = @michael.dishes.create!(name: "Scrambled Eggs", description: "World Famous Eggs!")

      @ingredient_1 = Ingredient.create!(name: "puff pastry", calories: 1200)
      @ingredient_2 = Ingredient.create!(name: "filet tenderloin", calories: 2000)
      @ingredient_3 = Ingredient.create!(name: "mushrooms", calories: 350)
      @ingredient_4 = Ingredient.create!(name: "rosemary", calories: 10)

      DishIngredient.create!(dish: @wellington, ingredient: @ingredient_1)
      DishIngredient.create!(dish: @wellington, ingredient: @ingredient_2)
      DishIngredient.create!(dish: @wellington, ingredient: @ingredient_3)
      DishIngredient.create!(dish: @wellington, ingredient: @ingredient_4)
    end

    it 'returns total calories from a specific dish' do
      expect(@wellington.total_calorie_count).to eq(3560)
    end
  end
end
