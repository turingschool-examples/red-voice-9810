require 'rails_helper'

RSpec.describe "Dish Show page" do
  describe 'When I visit a Dish show page' do
    it "I see the name of the dish, the description, a list of ingredients, and the chefs name" do
      chef = Chef.create!(name: "Chef Paul")
      dish1 = chef.dishes.create!(name: "Tuna Salad", description: "Tuna by Paul")
      ingredient1 = dish1.ingredients.create!(name: "Tuna", calories: 100 )
      ingredient2 = dish1.ingredients.create!(name: "Celery", calories: 10 )
      ingredient3 = dish1.ingredients.create!(name: "Mayo", calories: 1000 )

      visit "/dishes/#{dish1.id}"

      expect(page).to have_content(chef.name)
      expect(page).to have_content(dish1.name)
      expect(page).to have_content(dish1.description)
      expect(page).to have_content(ingredient1.name)
      expect(page).to have_content(ingredient2.name)
      expect(page).to have_content(ingredient3.name)
    end
  end
end
