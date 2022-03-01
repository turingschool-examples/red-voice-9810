class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredient_list 
    dishes.joins(:ingredients).select("ingredients.name, ingredients.calories").distinct
  end
end
