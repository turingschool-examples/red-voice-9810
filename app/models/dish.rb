class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients

  def chef_name
    Chef.find(chef_id).name
  end

  def calorie_count
    ingredients.sum(:calories)
  end
end
