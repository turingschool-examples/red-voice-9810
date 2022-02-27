require 'rails_helper'

RSpec.describe 'Chef Show Page' do
  before :each do
    @chef = Chef.create!(name:"Don")
    @chef2 = Chef.create!(name:"Lonnie")
    @dish1 = Dish.create!(name: "Sticky Rice", description: "tangy and sweet", chef_id: @chef.id)
    @dish2 = Dish.create!(name: "Mochi", description: "doughy with ice cream core", chef_id: @chef.id)
    @ingredient1 = Ingredient.create!(name: "Dough", calories: 100)
    @ingredient2 = Ingredient.create!(name: "Ice Cream", calories: 125)
    @ingredient3 = Ingredient.create!(name: "Rice", calories: 40)

    @joins_row1 = DishIngredient.create!(ingredient_id: @ingredient1.id, dish_id: @dish2.id)
    @joins_row2 = DishIngredient.create!(ingredient_id: @ingredient2.id, dish_id: @dish2.id)
  end
  
  it "Displays a chef's name" do 
    visit chef_path(@chef.id)
    expect(page).to have_content(@chef.name)
  end 

  it "Has a link that brings the user to the chef's ingredient index page" do 
    visit chef_path(@chef.id)
    expect(page).to have_link("List of ingredients #{@chef.name} uses in their dishes")
    click_link("List of ingredients #{@chef.name} uses in their dishes")
    expect(current_path).to eq(chef_ingredients_path(@chef.id))
    end 

    it "Lists the three most popular ingredients a chef uses in their dishes" do
    chef = Chef.create!(name:"Don")
    chef2 = Chef.create!(name:"Lonnie")
    dish1 = Dish.create!(name: "Sticky Rice", description: "tangy and sweet", chef_id: chef.id)
    dish2 = Dish.create!(name: "Mochi", description: "doughy with ice cream core", chef_id: chef.id)
    dish3 = Dish.create!(name: "Yum", description: "doughy with ice cream core", chef_id: chef.id)
    dish4 = Dish.create!(name: "Tasty", description: "doughy with ice cream core", chef_id: chef.id)
    dish5 = Dish.create!(name: "Delicioso", description: "doughy with ice cream core", chef_id: chef.id)
    dish6 = Dish.create!(name: "Sobresito", description: "doughy with ice cream core", chef_id: chef.id)
    ingredient1 = Ingredient.create!(name: "Dough", calories: 100)
    ingredient2 = Ingredient.create!(name: "Ice Cream", calories: 125)
    ingredient3 = Ingredient.create!(name: "Rice", calories: 40)
    ingredient4 = Ingredient.create!(name: "Slice", calories: 40)
    joins_row1 = DishIngredient.create!(ingredient_id: ingredient1.id, dish_id: dish1.id)
    joins_row2 = DishIngredient.create!(ingredient_id: ingredient1.id, dish_id: dish2.id)
    joins_row3 = DishIngredient.create!(ingredient_id: ingredient1.id, dish_id: dish3.id)
    joins_row4 = DishIngredient.create!(ingredient_id: ingredient1.id, dish_id: dish4.id)
    joins_row5 = DishIngredient.create!(ingredient_id: ingredient3.id, dish_id: dish1.id)
    joins_row6 = DishIngredient.create!(ingredient_id: ingredient3.id, dish_id: dish2.id)
    joins_row7 = DishIngredient.create!(ingredient_id: ingredient3.id, dish_id: dish3.id)
    joins_row8 = DishIngredient.create!(ingredient_id: ingredient2.id, dish_id: dish1.id)
    joins_row9 = DishIngredient.create!(ingredient_id: ingredient4.id, dish_id: dish1.id)
    joins_row10 = DishIngredient.create!(ingredient_id: ingredient4.id, dish_id: dish2.id)

    visit chef_path(chef.id)
    within '#top-three-ingredients' do 
      expect(page).to have_no_content(ingredient2.name)
    end 
    within "#top_ingredient-#{ingredient1.id}" do 
      expect(page).to have_content("Rank: 1 #{ingredient1.name}")
    end 
    within "#top_ingredient-#{ingredient3.id}" do 
      expect(page).to have_content("Rank: 2 #{ingredient3.name}")
    end 
    within "#top_ingredient-#{ingredient4.id}" do 
      expect(page).to have_content("Rank: 3 #{ingredient4.name}")
    end 
  end 
end 