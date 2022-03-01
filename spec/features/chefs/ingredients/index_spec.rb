require 'rails_helper'

RSpec.describe "Chef Ingredients Index page" do
  describe "When I visit the chef ingredients index" do
    it "has a unique list of all the ingredients used by this chef" do
      chef = Chef.create!(name: "Chef Paul")
      dish1 = chef.dishes.create!(name: "Tuna Salad", description: "Tuna by Paul")
      ingredient1 = dish1.ingredients.create!(name: "Tuna", calories: 100 )
      ingredient2 = dish1.ingredients.create!(name: "Celery", calories: 10 )
      ingredient3 = dish1.ingredients.create!(name: "Mayo", calories: 1000 )
      dish2 = chef.dishes.create!(name: "Chicken Salad", description: "Chicken by Paul")
      ingredient4 = dish2.ingredients.create!(name: "Chicken", calories: 100 )
      ingredient5 = dish2.ingredients.create!(name: "Grapes", calories: 100 )
      ingredient6 = dish2.ingredients.create!(name: "Mayo", calories: 1000 )

      visit "/chefs/#{chef.id}/ingredients"

      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name)
      expect(page).to have_content(ingredient3.name)
      expect(page).to have_content(ingredient4.name)
      expect(page).to have_content(ingredient5.name)
    end
  end
end
