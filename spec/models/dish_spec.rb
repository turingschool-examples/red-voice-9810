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

  describe 'instance methods' do

    before(:each) do
    @louis = Chef.create!(name: 'Chef Louis')

    @pizza = @louis.dishes.create!(name: 'Pizza', description: 'cheesy dough with sauce', chef_id: @louis)
    
    @ingredient1 = @pizza.ingredients.create!(name: 'dough', calories: 200)
    @ingredient2 = @pizza.ingredients.create!(name: 'mozarella cheese', calories: 150)
    @ingredient3 = @pizza.ingredients.create!(name: 'pasta sauce', calories: 100)
    end
    
    it 'gives sum of total calories for a dish' do
      expect(@pizza.total_calories).to eq(450)
    end
  end
end
