require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it 'returns ingredient list' do
      @chef_1 = Chef.create!(name: "Nick Smith")
      @dish_1 = Dish.create!(name: "Eggs Benedict", description: "Eggs on eggs on ham on bread" , chef_id: @chef_1.id)
      @dish_2 = Dish.create!(name: "Cake", description: "mmmmm cake" , chef_id: @chef_1.id)

      @ingredient_1 = Ingredient.create!(name: "Eggs", calories: 100)
      @ingredient_2 = Ingredient.create!(name: "Hollandaise", calories: 300)
      @ingredient_3 = Ingredient.create!(name: "Ham", calories: 200)
      @ingredient_4 = Ingredient.create!(name: "English Muffin", calories: 100)
      @ingredient_5 = Ingredient.create!(name: "Flour", calories: 100)

      @recipe_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
      @recipe_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
      @recipe_3 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)
      @recipe_4 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_4.id)
      @recipe_5 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_5.id)
      @recipe_6 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_1.id)
      # binding.pry

      expect(@chef_1.get_ingredients).to eq(["Eggs", "English Muffin", "Flour", "Ham", "Hollandaise"])
    end
  end
end
