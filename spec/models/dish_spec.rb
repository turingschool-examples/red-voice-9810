require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it { should belong_to :chef }
    it { should have_many :dish_ingredients }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe 'instance methods' do
      it 'can count the calories of each dish' do

      chef_1 = Chef.create!(name: "Gordon Ramsey")
      risotto = chef_1.dishes.create!(name: "Risotto", description: "Italian rice dish")
      rice = Ingredient.create!(name: "rice", calories: 300)
      broth = Ingredient.create!(name: "broth", calories: 250)
      butter = Ingredient.create!(name: "butter", calories: 400)

      DishIngredient.create!(dish_id: risotto.id, ingredient_id: rice.id)
      DishIngredient.create!(dish_id: risotto.id, ingredient_id: broth.id)
      DishIngredient.create!(dish_id: risotto.id, ingredient_id: butter.id)

      expect(risotto.calorie_count).to eq(950)
    end 
  end
end
