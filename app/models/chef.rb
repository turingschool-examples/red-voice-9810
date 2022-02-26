class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredient_list
    dishes.joins(:ingredients, :dish_ingredients)
      .select("ingredients.name").distinct
      .pluck('ingredients.name')
  end

  def most_popular_ingredients
    dishes.joins(:ingredients, :dish_ingredients)
      .select("ingredients.name, COUNT(ingredients.*) AS total_ingredient_count")
      .group('ingredients.name').order('total_ingredient_count DESC')
      .limit(3)
  end
end
