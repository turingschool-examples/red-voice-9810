class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def popular_ingredients
    ingredients.select('ingredients.*, count(ingredients) AS ingredient_count')
    .group('ingredients.id')
    .order('ingredient_count DESC')
    .limit(3)
  end
end
