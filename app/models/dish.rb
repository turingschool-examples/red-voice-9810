class Dish <ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :ingredient_dishes
  has_many :ingredients, through: :ingredient_dishes

  def list_ingredients
    ingredients.pluck(:name)
  end

  def chef_name
    chef.name
  end

  def calories_count
    ingredients.sum('calories')
  end
end
