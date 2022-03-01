require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe 'instance methods' do
    it 'shows unique ingredients used by each chef' do
      chef_1 = Chef.create!(name: "Gordon Ramsey")
      risotto = chef_1.dishes.create!(name: "Risotto", description: "Italian rice dish")
      scallops = chef_1.dishes.create!(name: "Scallops", description: "Crispy and pan seared")
      rice = Ingredient.create!(name: "rice", calories: 300)
      broth = Ingredient.create!(name: "broth", calories: 250)
      butter = Ingredient.create!(name: "butter", calories: 400)

      DishIngredient.create!(dish_id: risotto.id, ingredient_id: rice.id)
      DishIngredient.create!(dish_id: risotto.id, ingredient_id: broth.id)
      DishIngredient.create!(dish_id: risotto.id, ingredient_id: butter.id)
      DishIngredient.create!(dish_id: scallops.id, ingredient_id: butter.id)

      expect(chef_1.unique_ingredients).to eq([rice, broth, butter])
    end
  end
end
