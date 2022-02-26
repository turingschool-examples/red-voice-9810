require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dishes}
  end

  before(:each) do
    @chef_laura = Chef.create!(name: "Laura")

    @tacos = @chef_laura.dishes.create!(name: "Tacos", description: "For Tuesdays")
    @enchiladas = @chef_laura.dishes.create!(name: "Enchilidas", description: "Friday Special")

    @tortilla = Ingredient.create!(name: 'Tortilla', calories: 150)
    @cheese = Ingredient.create!(name: 'Cheese', calories: 200)
    @lettuce = Ingredient.create!(name: 'Lettuce', calories: 5)
    @sauce = Ingredient.create!(name: 'Enchilida Sauce', calories: 50)
    @carnitas = Ingredient.create!(name: 'Enchilida Sauce', calories: 350)

    @dish_ing_1 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @tortilla.id )
    @dish_ing_2 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @cheese.id )
    @dish_ing_3 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @lettuce.id )
    @dish_ing_4 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @tortilla.id )
    @dish_ing_5 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @cheese.id )
    @dish_ing_6 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @sauce.id )
  end

  describe '.instance methods' do
    describe '.ingredient_list' do
      it 'gets all ingredients a chef uses' do
        results = [@cheese.name, @sauce.name, @lettuce.name ,@tortilla.name,]
        expect(@chef_laura.ingredient_list).to eq(results)
      end
    end
  end
end
