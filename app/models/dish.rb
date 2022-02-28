class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def add_ingredient(ingredient)
    ingredients << ingredient
  end

  def calorie_count
    # for some reason sum is throwing an error
    ingredient_calories = self.ingredients.pluck(:calories)
    return ingredient_calories.sum
  end
end
