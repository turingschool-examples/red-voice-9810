require 'rails_helper'

RSpec.describe 'the c show page' do
  before (:each) do
    @chef_1 = Chef.create!(name: "Da Cook")
    @chef_2 = Chef.create!(name: "Duther Gui")
    @chef_3 = Chef.create!(name: "Sir Cooks-a-lot")
    @chef_4 = Chef.create!(name: "Frank N Furter")
    @dish_1 = @chef_1.dishes.create!(name: "food1",description: "tastes food")
    @dish_12 = @chef_1.dishes.create!(name: "food2",description: "maybe food")
    @dish_21 = @chef_2.dishes.create!(name: "food3",description: "yuck")
    @dish_22 = @chef_2.dishes.create!(name: "food4",description: "you have died of dysentary")
    @dish_31 = @chef_3.dishes.create!(name: "food5",description: 'nom nom')
    @dish_32 = @chef_3.dishes.create!(name: "food6",description: 'whatever')
    @dish_41 = @chef_4.dishes.create!(name: "food7",description: 'some words here')
    @dish_42 = @chef_4.dishes.create!(name: "food8",description: ' im out of ideas')
    @ingred_1 = Ingredient.create!(name: "dog food", calories: 100)
    @ingred_2 = Ingredient.create!(name: "cat", calories: 100)
    @ingred_3 = Ingredient.create!(name: "ferret food", calories: 100)
    @ingred_4 = Ingredient.create!(name: "leftover food", calories: 100)
    @ingred_5 = Ingredient.create!(name: "garbage food", calories: 100)
    @ingred_6 = Ingredient.create!(name: "roadkill probably", calories: 100)
    @ingred_7 = Ingredient.create!(name: "not sure", calories: 100)
    @ingred_8 = Ingredient.create!(name: "legal", calories: 100)
    @ingred_9 = Ingredient.create!(name: "not legal", calories: 100)
    @di_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingred_1.id)
    @di_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingred_2.id)
    @di_3 = DishIngredient.create!(dish_id: @dish_12.id, ingredient_id: @ingred_3.id)
    @di_4 = DishIngredient.create!(dish_id: @dish_31.id, ingredient_id: @ingred_4.id)
    @di_5 = DishIngredient.create!(dish_id: @dish_41.id, ingredient_id: @ingred_5.id)
    @di_6 = DishIngredient.create!(dish_id: @dish_32.id, ingredient_id: @ingred_6.id)
    @di_7 = DishIngredient.create!(dish_id: @dish_42.id, ingredient_id: @ingred_7.id)
    @di_8 = DishIngredient.create!(dish_id: @dish_21.id, ingredient_id: @ingred_8.id)
    @di_9 = DishIngredient.create!(dish_id: @dish_22.id, ingredient_id: @ingred_9.id)
  end

  it 'names the chef' do
    visit "/chefs/#{@chef_1.id}"
    expect(page).to have_content("#{@chef_1.name}")
  end
end
