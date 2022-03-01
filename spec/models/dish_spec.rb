require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :ingredient_dishes}
    it {should have_many(:ingredients).through :ingredient_dishes}
  end

  describe "methods" do
    it 'show ingredients' do
      chef = Chef.create(name: "Gaston Acurio")
      dish_1 = chef.dishes.create(name: "Ceviche", description: "Entree")
      dish_2 = chef.dishes.create(name: "Lomo Saltado", description: "Main dish")

      salt = Ingredient.create(name: 'Salt', calories: 70)
      pepper = Ingredient.create(name: 'Pepper', calories: 30)
      potatoes = Ingredient.create(name: 'Potatoes', calories: 170)

      IngredientDish.create(dish_id: dish_1.id, ingredient_id: salt.id)
      IngredientDish.create(dish_id: dish_1.id, ingredient_id: pepper.id)
      IngredientDish.create(dish_id: dish_2.id, ingredient_id: potatoes.id)

      expected = ['Salt', 'Pepper']

      expect(dish_1.list_ingredients).to eq(expected)

    end
  end
end
