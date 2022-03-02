require 'rails_helper'

RSpec.describe 'dish show page' do
  before(:each) do
    @louis = Chef.create!(name: 'Chef Louis')
    @bob = Chef.create!(name: 'Bob')

    @risotto = @louis.dishes.create!(name: 'Risotto', description: 'Northern Italian rice dish', chef_id: @louis)
    # @lasagne = Dish.create!(name: 'Lasagne', description: 'cheesy pasta goodness', chef_id: @louis)
    @pizza = @louis.dishes.create!(name: 'Pizza', description: 'cheesy dough with sauce', chef_id: @louis)
    
    @ingredient1 = @pizza.ingredients.create!(name: 'dough', calories: 200)
    @ingredient2 = @pizza.ingredients.create!(name: 'mozarella cheese', calories: 150)
    @ingredient3 = @pizza.ingredients.create!(name: 'pasta sauce', calories: 100)
    @ingredient4 = @risotto.ingredients.create!(name: 'risotto rice', calories: 150)
    
    visit dish_path(@pizza)
  end

  it 'shows dishs name and description' do
    expect(page).to have_content(@pizza.name)
    expect(page).to have_content(@pizza.description)
  end

  it 'shows list of ingredients for dish' do
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
    expect(page).to_not have_content(@ingredient4.name)
  end

  it 'shows chefs name for dish' do
    expect(page).to have_content(@louis.name)
    expect(page).to_not have_content(@bob.name)
  end

  it 'shows total calories for a dish' do
    expect(page).to have_content(@pizza.total_calories)
    save_and_open_page
  end
end