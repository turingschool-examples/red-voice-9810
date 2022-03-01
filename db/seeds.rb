# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DishIngredient.destroy_all
Ingredient.destroy_all
Dish.destroy_all
Chef.destroy_all

@chef_1 = Chef.create!(name: "Emeril")
@chef_2 = Chef.create!(name: "Bobby Flay")
@dish_1 = Dish.create!(name: "Tacos", description: "Meat and deliciousness with tortillas", chef_id: @chef_1.id)
@dish_2 = Dish.create!(name: "Fried Pickles", description: "Pickles... Fried.", chef_id: @chef_1.id)
@dish_3 = Dish.create!(name: "Ramen", description: "Adult soup", chef_id: @chef_1.id)
@dish_4 = Dish.create!(name: "Spaghetti", description: "Long noodles with meat sauce", chef_id: @chef_2.id)
@dish_5 = Dish.create!(name: "BBQ", description: "Slowly smoked meat that will make you miss summers on the patio", chef_id: @chef_2.id)
@ingredient_1 = Ingredient.create!(name: "Carnitas", calories: 220)
@ingredient_2 = Ingredient.create!(name: "Tortilla", calories: 150)
@ingredient_3 = Ingredient.create!(name: "Cheese", calories: 300)
@ingredient_4 = Ingredient.create!(name: "Pickle", calories: 50)
@ingredient_5 = Ingredient.create!(name: "Noodle", calories: 250)
@ingredient_6 = Ingredient.create!(name: "Brisket", calories: 310)
@ingredient_7 = Ingredient.create!(name: "Tomatoe Sauce", calories: 200)
@dish_ingredient_1 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
@dish_ingredient_2 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
@dish_ingredient_3 = DishIngredient.create!(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)
@dish_ingredient_4 = DishIngredient.create!(dish_id: @dish_2.id, ingredient_id: @ingredient_4.id)
@dish_ingredient_5 = DishIngredient.create!(dish_id: @dish_3.id, ingredient_id: @ingredient_5.id)
@dish_ingredient_6 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_5.id)
@dish_ingredient_6 = DishIngredient.create!(dish_id: @dish_4.id, ingredient_id: @ingredient_7.id)
@dish_ingredient_7 = DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @ingredient_1.id)
@dish_ingredient_7 = DishIngredient.create!(dish_id: @dish_5.id, ingredient_id: @ingredient_6.id)