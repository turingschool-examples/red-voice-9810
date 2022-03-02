class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def get_ingredients
    dishes = self.dishes
    ingredients = dishes.map do |dish|
      dish.ingredients
    end.uniq.flatten
  end
end
