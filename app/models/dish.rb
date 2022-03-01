class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :ingredient_dishes
  has_many :ingredients, through: :ingredient_dishes

  def list_of_ingredients
    ingredients.pluck(:name)
  end

  def name_of_chef
    # require "pry"; binding.pry
    chef.name
  end

  def total_calorie_count
    ingredients.sum('calories')
  end
end
