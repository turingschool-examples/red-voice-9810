class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def unique_ingredients
    unique = []
    self.dishes.each do |dish|
      dish.ingredients.each do |ingre|
        unique << ingre
      end.uniq!
    end
    return unique
  end
end
