class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredient_list
    self.dishes.joins(:ingredients).select("ingredients.*").distinct.to_a
  end
end
