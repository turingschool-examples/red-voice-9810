class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredient_list
    dishes.joins(:ingredients, :dish_ingredients)
      .select("ingredients.name").distinct
      .pluck('ingredients.name')
  end

end
