# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chef = Chef.create!(name: 'King Chef')
dish1 = chef.dishes.create!(name: 'King Krabé', description: 'Only food a king can eat')
ingredient1 = dish1.ingredients.create!(name: 'Crab', calories: 20)
ingredient2 = dish1.ingredients.create!(name: 'King Butter', calories: 100)
ingredient3 = dish1.ingredients.create!(name: 'Gold', calories: 0)
