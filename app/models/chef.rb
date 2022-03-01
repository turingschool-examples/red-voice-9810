class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def uniq_ingredients
    dishes.joins(:ingredients).select('ingredients.name').distinct
  end


  def top_3
    binding.pry
    self.dishes.joins(:ingredients)
    .select('ingredients.name')
    .group('ingredients.name').count
  end

  # in my view if I would have gotten the method down

  # <div id="top-3">
  #   <% @chef.top_3.each do |ingredient| %>
  #     <%= ingredient.name %>
  #   <% end %>
  # </div>
end
