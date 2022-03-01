require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many (:dish_ingredients)}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  before :each do
    @chef1 = Chef.create!(name: 'Cooker')
    @chili = Dish.create!(name: 'chili', description: 'very spicy', chef_id: @chef1.id)

    @sugar = Ingredient.create!(name: 'sugar', calories: 25)
    @salt = Ingredient.create!(name: 'salt', calories: 7)
    @lime = Ingredient.create!(name: 'lime', calories: 43)
    @beans = Ingredient.create!(name: 'beans', calories: 11)
    @jalps = Ingredient.create!(name: 'jalps', calories: 71)
    @flour = Ingredient.create!(name: 'flour', calories: 1)
    @apples = Ingredient.create!(name: 'apples', calories: 22)
    @bread = Ingredient.create!(name: 'bread', calories: 8)
    @eggs = Ingredient.create!(name: 'eggs', calories: 43)
    @chips = Ingredient.create!(name: 'chips', calories: 11)
    @something_special = Ingredient.create!(name: 'something_special', calories: 1)

    DishIngredient.create!(ingredient_id: @sugar.id, dish_id: @chili.id)
    DishIngredient.create!(ingredient_id: @apples.id, dish_id: @chili.id)
    DishIngredient.create!(ingredient_id: @beans.id, dish_id: @chili.id)
    DishIngredient.create!(ingredient_id: @bread.id, dish_id: @chili.id)

  end

  it 'will calculate the amount of calories a dsh has' do

   expect(@chili.total_calories).to eq(66)
  end
end
