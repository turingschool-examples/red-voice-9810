require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    it 'returns chef name' do
      chef_1 = Chef.create!(name: "Nick Smith")
      dish_1 = Dish.create!(name: "Eggs Benedict", description: "Eggs on eggs on ham on bread" , chef_id: chef_1.id)
      expect(dish_1.get_chef_name).to eq("Nick Smith")
    end

    it 'returns list of ingredients' do
      chef_1 = Chef.create!(name: "Nick Smith")
      dish_1 = Dish.create!(name: "Eggs Benedict", description: "Eggs on eggs on ham on bread" , chef_id: chef_1.id)
      ingredient_1 = Ingredient.create!(name: "Eggs", calories: 100)
      ingredient_2 = Ingredient.create!(name: "Hollandaise", calories: 300)
      ingredient_3 = Ingredient.create!(name: "Ham", calories: 200)

      recipe_1 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
      recipe_2 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
      recipe_3 = DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_3.id)

      expect(dish_1.calorie_count).to eq(600)
    end
  end
end
