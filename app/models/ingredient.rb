class Ingredient < ApplicationRecord
  validates_presence_of :name
  validates :calories, presence: true, numericality: true
  has_many :dish_ingredients
  has_many :dishes, through: :dish_ingredients
end
