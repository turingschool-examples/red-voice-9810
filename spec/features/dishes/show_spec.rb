require 'rails_helper'

RSpec.describe 'Dish Show Page' do
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
  
  it "Displays a dish's name and description" do 
    visit dish_path(@dish2.id)
    expect(page).to have_content(@dish2.name)
    expect(page).to have_content(@dish2.description)
    expect(page).to have_no_content(@dish1.name)
    expect(page).to have_no_content(@dish1.description)
  end 

  it "Displays a list of ingredients for a dish" do 
    visit dish_path(@dish2.id)
    within '#dough' do
      expect(page).to have_content(@ingredient1.name)
    end
    within '#ice-cream' do  
      expect(page).to have_content(@ingredient2.name)
    end 
    expect(page).to have_no_content(@ingredient3.name)
  end 

  it 'Displays the name of the chef a dish belongs to' do 
    visit dish_path(@dish2.id)
    expect(page).to have_content(@chef.name)
    expect(page).to have_no_content(@chef2.name)
  end 

  it 'Displays the total calorie count for a dish' do 
    visit dish_path(@dish2.id)
    expect(page).to have_content(@chef.name)
  end 
end 