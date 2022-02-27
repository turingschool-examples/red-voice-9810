class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes
  has_many :ingredients, through: :dishes

  def top_three_ingredients
    ingredients
    .select("ingredients.*, COUNT(dish_ingredients) AS dish_count")
    .joins(:dishes)
    .joins(:dish_ingredients)
    .group(:id)
    .order(dish_count: :desc)
    .limit(3)
  end   
end
