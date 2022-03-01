class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes


  def unique_ingredients
    all_ingredients = []
    dishes.each do |dish|
      all_ingredients << dish.ingredients
    end
    # require "pry"; binding.pry
    all_ingredients.uniq
    # dishes.joins(:ingredients).distinct(:name)
  #   # dishes.distinct.pluck(:ingredients)
  end
end
