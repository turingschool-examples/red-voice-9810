require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :calories}
  end

  describe "relationships" do
    it {should have_many :dish_ingredients}
    #it {should have_many (:ingredients).through(:dish_ingredients)} - Kept Getting Error  undefined method `through' for :ingredients:Symbol
  end

  it "shows total calories" do
    @chef_1 = Chef.create!(name: "Gordan Ramsey")
    @dish_1 = @chef_1.dishes.create!(name: "Beef Welington", description: "Giant wrapped beef in dough")
    @ingredient_1 = @dish_1.ingredients.create!(name: "Beef", calories: 420)
    @ingredient_2 = @dish_1.ingredients.create!(name: "Dough", calories: 23)
    @ingredients = Ingredient.all

    expect(@ingredients.total_calories).to eq(443)
  end
end
