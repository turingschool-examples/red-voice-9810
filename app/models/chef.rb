class Chef < ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def get_ingredients
    dishes
    .joins(:ingredients)
    .select('ingredients.*')
    .distinct
  end

end
