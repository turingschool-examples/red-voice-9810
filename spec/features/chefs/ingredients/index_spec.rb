require 'rails_helper'

RSpec.describe 'chef ingredients index' do
  before(:each) do
    @louis = Chef.create!(name: 'Chef Louis')
    @bob = Chef.create!(name: 'Bob Belcher')

    @risotto = @louis.dishes.create!(name: 'Risotto', description: 'Northern Italian rice dish', chef_id: @louis)
    @lasagne = @louis.dishes.create!(name: 'Lasagne', description: 'cheesy pasta goodness', chef_id: @louis)
    @pizza = @louis.dishes.create!(name: 'Pizza', description: 'cheesy dough with sauce', chef_id: @louis)
    @burger = @bob.dishes.create!(name: 'Burger', description: 'meat patty on sesame seed bun', chef_id: @bob)
    
    @ingredient1 = @pizza.ingredients.create!(name: 'dough', calories: 200)
    @ingredient2 = @pizza.ingredients.create!(name: 'mozarella cheese', calories: 150)
    @ingredient3 = @pizza.ingredients.create!(name: 'pasta sauce', calories: 100)
    @ingredient4 = @risotto.ingredients.create!(name: 'risotto rice', calories: 150)
    @ingredient5 = @lasagne.ingredients.create!(name: 'pasta sauce', calories: 100)
    @ingredient6 = @burger.ingredients.create!(name: 'meat patty', calories: 150)
    
    visit chef_ingredients_path(@louis.id)
  end 

  it 'shows a unique list of ingredient names that this chef uses' do
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
    expect(page).to have_content(@ingredient4.name)
    expect(page).to_not have_content(@ingredient5.name)
    expect(page).to_not have_content(@ingredient6.name)
  end
end