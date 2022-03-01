class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def used_ingredients
    dishes.joins(:ingredients)
          .pluck('ingredients.name')
  end
end
