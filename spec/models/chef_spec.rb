require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  describe 'instance methods' do

    before(:each) do
      @chef = Chef.create!(name: "Cheffy")
      @chef2 = Chef.create!(name: "Chef Jr.")
      @dish1 = @chef.dishes.create!(name: "Da_dish", description: "Dishy")
      @dish2 = @chef.dishes.create!(name: "Yum Yum", description: "Yummy")
      @dish3 = @chef2.dishes.create!(name: "carmel", description: "sweeet")
      @dish4 = @chef.dishes.create!(name: "cookies", description: "sweeet")
      @ingredient1 = Ingredient.create!(name: "flour", calories: 364)
      @ingredient2 = Ingredient.create!(name: "butter", calories: 128)
      @ingredient3 = Ingredient.create!(name: "sugar", calories: 228)
      @ingredient4 = Ingredient.create!(name: "chocolate chips", calories: 128)
      @dish_ingredient1 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient1.id)
      @dish_ingredient2 = DishIngredient.create!(dish_id: @dish1.id, ingredient_id: @ingredient2.id)
      @dish_ingredient3 = DishIngredient.create!(dish_id: @dish3.id, ingredient_id: @ingredient3.id)
      @dish_ingredient4 = DishIngredient.create!(dish_id: @dish4.id, ingredient_id: @ingredient1.id)
      @dish_ingredient5 = DishIngredient.create!(dish_id: @dish4.id, ingredient_id: @ingredient2.id)
      @dish_ingredient6 = DishIngredient.create!(dish_id: @dish4.id, ingredient_id: @ingredient3.id)
      @dish_ingredient6 = DishIngredient.create!(dish_id: @dish4.id, ingredient_id: @ingredient4.id)
      @dish_ingredient7 = DishIngredient.create!(dish_id: @dish2.id, ingredient_id: @ingredient2.id)
    end

    describe '.popular_ingredients' do
      it "returns the three most popular ingredients" do
        expect(@chef.popular_ingredients).to eq([@ingredient2, @ingredient1, @ingredient3])
      end
    end
  end
end
