require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
    it {should belong_to :chef}
  end


  before(:each) do
    @chef = Chef.create!(name: "Mario")
    @dish = @chef.dishes.create!(name: "Fettucine Alfredo", description: "Deliciousness")
    @ingredient = Ingredient.create!(name: "Pasta", calories: 300)
    @ingredient2 = Ingredient.create!(name: "Alfredo Sauce", calories: 200)
    @ingredient3 = Ingredient.create!(name: "Pepper", calories: 10)
    @dish_ingredient = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient.id)
    @dish_ingredient2 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient2.id)
    @dish_ingredient3 = DishIngredient.create!(dish_id: @dish.id, ingredient_id: @ingredient3.id)
  end

  it ".calorie_count" do

    expect(@dish.calorie_count).to eq(510)
  end
end
