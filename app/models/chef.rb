class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def all_ingredients
    dishes.joins(:ingredients, :ingredient_dishes)
          .select("ingredients.name")
          .distinct
          .pluck('ingredients.name')
  end
end
