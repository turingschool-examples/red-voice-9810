require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many(:ingredients).through(:dishes)}
  end

  before :each do
    @chef = Chef.create!(name:"Don")
    @chef2 = Chef.create!(name:"Lonnie")

    @dish1 = Dish.create!(name: "Sticky Rice", description: "tangy and sweet", chef_id: @chef.id)
    @dish2 = Dish.create!(name: "Mochi", description: "doughy with ice cream core", chef_id: @chef.id)
    @dish3 = Dish.create!(name: "Yum", description: "doughy with ice cream core", chef_id: @chef.id)
    @dish4 = Dish.create!(name: "Tasty", description: "doughy with ice cream core", chef_id: @chef.id)
    @dish5 = Dish.create!(name: "Delicioso", description: "doughy with ice cream core", chef_id: @chef.id)
    @dish6 = Dish.create!(name: "Sobresito", description: "doughy with ice cream core", chef_id: @chef.id)

    @ingredient1 = Ingredient.create!(name: "Dough", calories: 100)
    @ingredient2 = Ingredient.create!(name: "Ice Cream", calories: 125)
    @ingredient3 = Ingredient.create!(name: "Rice", calories: 40)
    @ingredient4 = Ingredient.create!(name: "Slice", calories: 40)

    @joins_row1 = DishIngredient.create!(ingredient_id: @ingredient1.id, dish_id: @dish1.id)
    @joins_row2 = DishIngredient.create!(ingredient_id: @ingredient1.id, dish_id: @dish2.id)
    @joins_row3 = DishIngredient.create!(ingredient_id: @ingredient1.id, dish_id: @dish3.id)
    @joins_row4 = DishIngredient.create!(ingredient_id: @ingredient1.id, dish_id: @dish4.id)
    @joins_row5 = DishIngredient.create!(ingredient_id: @ingredient3.id, dish_id: @dish1.id)
    @joins_row6 = DishIngredient.create!(ingredient_id: @ingredient3.id, dish_id: @dish2.id)
    @joins_row7 = DishIngredient.create!(ingredient_id: @ingredient3.id, dish_id: @dish3.id)
    @joins_row8 = DishIngredient.create!(ingredient_id: @ingredient2.id, dish_id: @dish1.id)
    @joins_row9 = DishIngredient.create!(ingredient_id: @ingredient4.id, dish_id: @dish1.id)
    @joins_row10 = DishIngredient.create!(ingredient_id: @ingredient4.id, dish_id: @dish2.id)
  end

  describe 'instance methods' do 
    describe '#top_three_ingredients' do 
      it 'returns the top three ingredients that are used in the most dishes' do 
        expect(@chef.top_three_ingredients).to eq([@ingredient1, @ingredient3, @ingredient4])
      end 
    end
  end

end
