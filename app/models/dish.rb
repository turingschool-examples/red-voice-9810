class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

# I'm still not 100% sure whether it's better to write this method here as an instance method 
# Or if it would be more restful to put this method in Ingredient as a class method 
  def calorie_count
   ingredients.sum(:calories)
  end 
end
