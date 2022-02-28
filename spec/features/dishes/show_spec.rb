require 'rails_helper'

RSpec.describe 'Dish Show Page', type: :features do
    before :each do 
        @chef_1 = Chef.create!(name: 'Tom')
        @ingredient_1 = Ingredient.create!(name: 'Cheese', calories: 30)
        @ingredient_2 = Ingredient.create!(name: 'Linguini', calories: 50)
        @dish_1 = Dish.create!(name: 'Pasta', description: 'Mac and Cheese', chef_id: @chef_1.id)
        @dish_1.add_ingredient(@ingredient_1)
        @dish_1.add_ingredient(@ingredient_2)
    end
    it 'will show the dish name' do 
        visit "/dishes/#{@dish_1.id}/"
        expect(page).to have_content(@dish_1.name)
    end
    it 'will show the ingredients of a dish' do 
        visit "/dishes/#{@dish_1.id}/"
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
    end
    it 'will show the name of the chef' do 
        visit "/dishes/#{@dish_1.id}/"
        expect(page).to have_content(@dish_1.chef.name)
    end
    it 'will show the total calorie count for a dish' do 
        visit "/dishes/#{@dish_1.id}/"
        expect(page).to have_content(@dish_1.calorie_count)

    end
end
