require 'rails_helper'

RSpec.describe 'Chef Ingredients Index Page' do
  before :each do
    @chef = Chef.create!(name:"Don")
    @chef2 = Chef.create!(name:"Lonnie")
    @dish1 = Dish.create!(name: "Sticky Rice", description: "tangy and sweet", chef_id: @chef.id)
    @dish2 = Dish.create!(name: "Mochi", description: "doughy with ice cream core", chef_id: @chef.id)
    @dish3 = Dish.create!(name: "Gross", description: "doughy with ice cream core", chef_id: @chef2.id)
    @ingredient1 = Ingredient.create!(name: "Dough", calories: 100)
    @ingredient2 = Ingredient.create!(name: "Ice Cream", calories: 125)
    @ingredient3 = Ingredient.create!(name: "Rice", calories: 40)
    @ingredient4 = Ingredient.create!(name: "Sticky Syrup", calories: 80)
    @ingredient5 = Ingredient.create!(name: "Gross Syrup", calories: 90)

    @joins_row1 = DishIngredient.create!(ingredient_id: @ingredient1.id, dish_id: @dish2.id)
    @joins_row2 = DishIngredient.create!(ingredient_id: @ingredient2.id, dish_id: @dish2.id)
    @joins_row3 = DishIngredient.create!(ingredient_id: @ingredient3.id, dish_id: @dish1.id)
    @joins_row4 = DishIngredient.create!(ingredient_id: @ingredient4.id, dish_id: @dish1.id)
    @joins_row5 = DishIngredient.create!(ingredient_id: @ingredient5.id, dish_id: @dish3.id)
  end
  
  it "Displays all ingredients a chef uses in their dishes" do 
    visit chef_ingredients_path(@chef.id)
    save_and_open_page
    within '#ingredients' do 
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient2.name)
      expect(page).to have_content(@ingredient3.name)
      expect(page).to have_content(@ingredient4.name)
      expect(page).to have_no_content(@ingredient5.name)
    end 
  end 

end