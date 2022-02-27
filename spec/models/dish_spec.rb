require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  before :each do 
    @chef = Chef.create!(name:"Don")
    @dish1 = Dish.create!(name: "Sticky Rice", description: "tangy and sweet", chef_id: @chef.id)
    @dish2 = Dish.create!(name: "Mochi", description: "doughy with ice cream core", chef_id: @chef.id)
    @ingredient1 = Ingredient.create!(name: "Dough", calories: 100)
    @ingredient2 = Ingredient.create!(name: "Ice Cream", calories: 125)
    @ingredient3 = Ingredient.create!(name: "Rice", calories: 40)

    @joins_row1 = DishIngredient.create!(ingredient_id: @ingredient1.id, dish_id: @dish2.id)
    @joins_row2 = DishIngredient.create!(ingredient_id: @ingredient2.id, dish_id: @dish2.id)
  end

  describe 'instance methods' do 
    describe '#calorie_count' do 
      it 'returns the sum of calories for all ingredients that belong to a dish' do 
        expect(@dish2.calorie_count).to eq(225)
      end
    end
  end 
end
