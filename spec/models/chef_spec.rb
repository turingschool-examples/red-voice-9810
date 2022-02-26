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
    @burrito = @chef_laura.dishes.create!(name: "Burrito", description: "Monday Only!")
    @carnitas_plate = @chef_laura.dishes.create!(name: "Carnitas Plate", description: "Weekends")

    @tortilla = Ingredient.create!(name: 'Tortilla', calories: 150)
    @cheese = Ingredient.create!(name: 'Cheese', calories: 200)
    @lettuce = Ingredient.create!(name: 'Lettuce', calories: 5)
    @sauce = Ingredient.create!(name: 'Enchilida Sauce', calories: 50)
    @carnitas = Ingredient.create!(name: 'Carnitas', calories: 350)

    @dish_ing_1 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @tortilla.id )
    @dish_ing_2 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @cheese.id )
    @dish_ing_3 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @lettuce.id )
    @dish_ing_3 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @carnitas.id )
    @dish_ing_4 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @tortilla.id )
    @dish_ing_5 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @cheese.id )
    @dish_ing_6 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @sauce.id )
    @dish_ing_6 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @carnitas.id )
    @dish_ing_4 = DishIngredient.create!(dish_id: @burrito.id, ingredient_id: @tortilla.id )
    @dish_ing_6 = DishIngredient.create!(dish_id: @burrito.id, ingredient_id: @carnitas.id )
    @dish_ing_6 = DishIngredient.create!(dish_id: @carnitas_plate.id, ingredient_id: @carnitas.id )
  end

  describe '.instance methods' do
    describe '.ingredient_list' do
      it 'gets all ingredients a chef uses' do

        results = @chef_laura.ingredient_list
        expect(results).to include(@carnitas.name)
        expect(results).to include(@cheese.name)
        expect(results).to include(@sauce.name)
        expect(results).to include(@lettuce.name)
        expect(results).to include(@tortilla.name)
      end
    end

    describe '.most_popular_ingredients' do
      it 'gets 3 most used ingredients' do

        results = @chef_laura.most_popular_ingredients
        expect(results[0].name).to eq(@carnitas.name)
        expect(results[1].name).to eq(@tortilla.name)
        expect(results[2].name).to eq(@cheese.name)
        expect(results.length).to eq(3)
      end
    end
  end
end
