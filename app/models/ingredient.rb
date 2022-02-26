class Ingredient < ApplicationRecord
  has_many :dishes, through: :dish_ingredients
end
