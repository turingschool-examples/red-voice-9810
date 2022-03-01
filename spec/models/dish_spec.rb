require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it { should have_many :ingredient_dishes }
    it { should have_many(:ingredients).through :ingredient_dishes }
  end

  describe 'instance methods' do
    it 'list of ingredients' do
      chef = Chef.create(name: "Gordon Ramsey")
      dish_1 = chef.dishes.create(name: "Roasted beef", description: "hot dish")
      dish_2 = chef.dishes.create(name: "Potatoe Salad", description: "cold dish")

      beef = Ingredient.create(name: 'Beef', calories: 300)
      pepper = Ingredient.create(name: 'Pepper', calories: 30)
      potatoes = Ingredient.create(name: 'Potatoes', calories: 170)

      IngredientDish.create(dish_id: dish_1.id, ingredient_id: beef.id)
      IngredientDish.create(dish_id: dish_1.id, ingredient_id: pepper.id)
      IngredientDish.create(dish_id: dish_2.id, ingredient_id: potatoes.id)

      expect(dish_1.list_of_ingredients).to eq(['Beef', 'Pepper'])
    end

    it 'shows chefs name' do
      chef = Chef.create(name: "Gordon Ramsey")
      dish_1 = chef.dishes.create(name: "Roasted beef", description: "hot dish")
      dish_2 = chef.dishes.create(name: "Potatoe Salad", description: "cold dish")

      beef = Ingredient.create(name: 'Beef', calories: 300)
      pepper = Ingredient.create(name: 'Pepper', calories: 30)
      potatoes = Ingredient.create(name: 'Potatoes', calories: 170)

      IngredientDish.create(dish_id: dish_1.id, ingredient_id: beef.id)
      IngredientDish.create(dish_id: dish_1.id, ingredient_id: pepper.id)
      IngredientDish.create(dish_id: dish_2.id, ingredient_id: potatoes.id)

      expect(dish_1.name_of_chef).to eq("Gordon Ramsey")
    end

    it 'stotal calorie count' do
      chef = Chef.create(name: "Gordon Ramsey")
      dish_1 = chef.dishes.create(name: "Roasted beef", description: "hot dish")
      dish_2 = chef.dishes.create(name: "Potatoe Salad", description: "cold dish")

      beef = Ingredient.create(name: 'Beef', calories: 300)
      pepper = Ingredient.create(name: 'Pepper', calories: 30)
      potatoes = Ingredient.create(name: 'Potatoes', calories: 170)

      IngredientDish.create(dish_id: dish_1.id, ingredient_id: beef.id)
      IngredientDish.create(dish_id: dish_1.id, ingredient_id: pepper.id)
      IngredientDish.create(dish_id: dish_2.id, ingredient_id: potatoes.id)

      expect(dish_1.total_calorie_count).to eq(330)
    end
  end
end
