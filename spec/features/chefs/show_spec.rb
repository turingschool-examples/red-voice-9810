require 'rails_helper'

RSpec.describe "Chef Show Page" do
  before(:each) do
    @chef = Chef.create!(name: "Gordon Ramsay")
    @chef_two = Chef.create!(name: "Ruben Pasillas")
    @dish = @chef.dishes.create!(name: "Banana Bread", description: "Yea.")
    @dish_two = @chef_two.dishes.create!(name: "Key Lime Pie", description: "Mmm, pie.")
    @ing_1 = @dish.ingredients.create!(name: "Egg", calories: 60)
    @ing_2 = @dish.ingredients.create!(name: "Bana", calories: 80)
  end
end
