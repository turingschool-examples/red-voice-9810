require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  before(:each) do
    @sakic = Chef.create!(name: "Sakic")

    @pasta = @sakic.dishes.create!(name: "Pasta", description: "with cream sauce")
    @roast = @sakic.dishes.create!(name: "Pork Roast", description: "with rosemary")

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

  describe '.instance methods' do
    describe '.ingredient_list' do
      it 'gets all ingredients a chef uses' do

        results = @sakic.ingredient_list
        expect(results).to include(@noodles.name)
        expect(results).to include(@cheese.name)
        expect(results).to include(@pepper.name)
        expect(results).to include(@pork.name)
      end
    end
  end
end
