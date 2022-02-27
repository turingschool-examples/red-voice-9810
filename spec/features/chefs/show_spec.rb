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

end 