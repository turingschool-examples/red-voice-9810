require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before :each do
    @chef = Chef.create!(name:"Don")
    @dish1 = Dish.create!(name: "Sticky Rice", description: "tangy and sweet", chef_id: @chef.id)
    @dish2 = Dish.create!(name: "Mochi", description: "doughy with ice cream core", chef_id: @chef.id)
  end
  
  it "Displays a dish's name and description" do 
    visit dish_path(@dish2.id)
    expect(page).to have_content(@dish2.name)
    expect(page).to have_content(@dish2.description)
    expect(page).to have_no_content(@dish1.name)
    expect(page).to have_no_content(@dish1.description)
  end 
end 