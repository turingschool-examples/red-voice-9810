require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many(:dish_ingredients) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe '#total_energy' do
    chef1 = Chef.create!(name: "Chef Boyardee")
    cheese_grits = chef1.dishes.create!(name: "Cheesy grits", description: "savory comfort food")

    # 100 + 100 + 10 is 210 
    cheese = cheese_grits.ingredients.create!(name: "cheddar cheese", energy: 100)
    grits = cheese_grits.ingredients.create!(name: "grits", energy: 100)
    chicken = cheese_grits.ingredients.create!(name: "chicken broth", energy: 10)

    expect(cheese_grits.total_energy).to eq(210)
  end
end
