class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def get_ingredients
    dishes.joins(:ingredients, :dish_ingredients)
          .select("ingredients.name")
          .distinct
          .pluck('ingredients.name')
    # binding.pry
  end
end
