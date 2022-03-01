class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients 
    dishes.joins(:ingredients)
    .select("ingredients.*")
  end

  def ingredient_list 
    ingredients.select("ingredients.name, ingredients.calories")
    .distinct
  end

  def popular_ingredients
    ingredients
    .group('ingredients.id')
    .select("ingredients.name, count(ingredients.id) as dish_count")
    .order("dish_count desc")
    .limit(3)
  end
end
