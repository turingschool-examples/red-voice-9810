class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes


  def ingredients_list
    # require "pry"; binding.pry
    
    dishes.joins(:ingredients, :ingredient_dishes)
          .select("ingredients.name")
          .distinct
          .pluck("ingredients.name")
  end
end
