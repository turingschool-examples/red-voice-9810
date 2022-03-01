require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
  end

  before(:each) do
    @gunnar = Chef.create!(name: "Gunnar")
    @sakic = Chef.create!(name: "Sakic")

    @pasta = @gunnar.dishes.create!(name: "Pasta", description: "with cream sauce")
    @roast = @gunnar.dishes.create!(name: "Pork Roast", description: "with rosemary")

    @noodles = Ingredient.create!(name: 'Noodles', calories: 300)
    @cheese = Ingredient.create!(name: 'Cheese', calories: 200)
    @pepper = Ingredient.create!(name: 'Pepper', calories: 5)
    @pork = Ingredient.create!(name: 'Pork', calories: 50)

    @dish1 = DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @noodles.id )
    @dish2 = DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @cheese.id )
    @dish3 = DishIngredient.create!(dish_id: @pasta.id, ingredient_id: @pepper.id )
    @dish4 = DishIngredient.create!(dish_id: @roast.id, ingredient_id: @noodles.id )
    @dish5 = DishIngredient.create!(dish_id: @roast.id, ingredient_id: @cheese.id )
    @dish6 = DishIngredient.create!(dish_id: @roast.id, ingredient_id: @pork.id )
  end
  describe ".instance methods" do
    describe '.total_calories' do
      it 'counts all calories in dish' do
        expect(@pasta.total_calories).to be(505)
      end
    end
  end
end
