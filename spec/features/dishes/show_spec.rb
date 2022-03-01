require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before(:each) do
    @chef = Chef.create!(name: "Gordon Ramsay")
    @dish = @chef.dishes.create!(name: "Clam Chowder", description: "Plain Old Clam Chowder")
  end

  it 'Displays dish name and description' do

  end

  it 'Displays Dish Ingredients' do

  end

end
