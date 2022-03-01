require 'rails_helper'

RSpec.describe "Chef Show page" do
  describe 'When I visit a Chef show page' do
    it "has the chefs name, and a link to the chef's ingredients index page" do
      chef = Chef.create!(name: "Chef Paul")
      dish1 = chef.dishes.create!(name: "Tuna Salad", description: "Tuna by Paul")
      ingredient1 = dish1.ingredients.create!(name: "Tuna", calories: 100 )
      ingredient2 = dish1.ingredients.create!(name: "Celery", calories: 10 )
      ingredient3 = dish1.ingredients.create!(name: "Mayo", calories: 1000 )
      dish2 = chef.dishes.create!(name: "Chicken Salad", description: "Chicken by Paul")
      ingredient4 = dish2.ingredients.create!(name: "Chicken", calories: 100 )
      ingredient5 = dish2.ingredients.create!(name: "Grapes", calories: 100 )
      ingredient6 = dish2.ingredients.create!(name: "Mayo", calories: 1000 )

      visit "/chefs/#{chef.id}"

      expect(page).to have_content(chef.name)
      click_link("#{chef.name} Ingredients Index")
      expect(current_path).to eq("/chefs/#{chef.id}/ingredients")
    end
  end
end
