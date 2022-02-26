# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Chef.destroy_all
Dish.destroy_all
Ingredient.destroy_all
DishIngredient.destroy_all

@chef_greg = Chef.create!(name: "Greg")
@chef_laura = Chef.create!(name: "Laura")

@tacos = @chef_greg.dishes.create!(name: "Tacos", description: "For Tuesdays")
@enchiladas = @chef_greg.dishes.create!(name: "Enchilidas", description: "Friday Special")

@tortilla = Ingredient.create!(name: 'Tortilla', calories: 150)
@cheese = Ingredient.create!(name: 'Cheese', calories: 200)
@lettuce = Ingredient.create!(name: 'Lettuce', calories: 5)
@sauce = Ingredient.create!(name: 'Enchilida Sauce', calories: 50)

@dish_ing_1 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @tortilla.id )
@dish_ing_2 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @cheese.id )
@dish_ing_3 = DishIngredient.create!(dish_id: @tacos.id, ingredient_id: @lettuce.id )
@dish_ing_4 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @tortilla.id )
@dish_ing_5 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @cheese.id )
@dish_ing_6 = DishIngredient.create!(dish_id: @enchiladas.id, ingredient_id: @sauce.id )
