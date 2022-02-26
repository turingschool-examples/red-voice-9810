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

  before(:each) do
    @chef_greg = Chef.create!(name: "Greg")

    @tacos = @chef_greg.dishes.create!(name: "Tacos", description: "For Tuesdays")

    @tortilla = Ingredient.create!(name: 'Tortilla', calories: 150)
    @cheese = Ingredient.create!(name: 'Cheese', calories: 200)
    @lettuce = Ingredient.create!(name: 'Lettuce', calories: 5)

    @dish_ing_1 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @tortilla.id )
    @dish_ing_2 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @cheese.id )
    @dish_ing_3 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @lettuce.id )
  end
  describe ".instance methods" do
    describe '.calorie_count' do
      it 'counts all calories in dish' do
        expect(@tacos.calorie_count).to be(355)
      end
    end
  end
end
