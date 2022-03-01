require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "instance methods" do
    it 'ingredients list' do
      chef = Chef.create(name: "Gordon Ramsey")
      chef_2 = Chef.create(name: "Uncle Roger")
      dish_1 = chef.dishes.create(name: "Roasted beef", description: "hot dish")
      dish_2 = chef.dishes.create(name: "Potatoe Salad", description: "cold dish")
      dish_3 = chef_2.dishes.create(name: "Tacos", description: "entree")

      beef = Ingredient.create(name: 'Beef', calories: 300)
      pepper = Ingredient.create(name: 'Pepper', calories: 30)
      potatoes = Ingredient.create(name: 'Potatoes', calories: 170)
      tortillas = Ingredient.create(name: 'Tortillas', calories: 100)

      IngredientDish.create(dish_id: dish_1.id, ingredient_id: beef.id)
      IngredientDish.create(dish_id: dish_1.id, ingredient_id: pepper.id)
      IngredientDish.create(dish_id: dish_2.id, ingredient_id: potatoes.id)
      IngredientDish.create(dish_id: dish_3.id, ingredient_id: tortillas.id)

      expect(chef.ingredients_list).to eq(["Beef", "Pepper", "Potatoes"])
    end
  end
end
