require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end


  describe 'instance methods' do
    it '#uniq_ingredients' do
      chef1 = Chef.create!(name: "Chef")

      # alfredo and mac and cheese both have pasta and cheese
      alfredo = chef1.dishes.create!(name: "fettuccine alfredo", description: "Al dente pasta in a savory cream sauce")

      cheese = alfredo.ingredients.create!(name: "cheese", energy: 100)
      pasta = alfredo.ingredients.create!(name: "pasta", energy: 400)
      garlic = alfredo.ingredients.create!(name: "garlic", energy: 5)
      cream = alfredo.ingredients.create!(name: "heavy cream", energy: 500)

      mac_and_cheese = chef1.dishes.create!(name: "mac and cheese", description: "cheesy mac and cheese cooked to perfection")

      cheese = mac_and_cheese.ingredients.create!(name: "cheese", energy: 100)
      pasta = mac_and_cheese.ingredients.create!(name: "pasta", energy: 400)
      chicken = mac_and_cheese.ingredients.create!(name: "chicken broth", energy: 10)
      bacon = mac_and_cheese.ingredients.create!(name: "bacon sprinkles", energy: 200)

      method_used = chef1.uniq_ingredients.map do |ingredient|
        ingredient.name
      end

      unique_list = [cheese.name, pasta.name, garlic.name, cream.name, chicken.name, bacon.name]

      expect(method_used.sort).to eq(unique_list.sort)
    end
  end
end
