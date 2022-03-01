require 'rails_helper' 

RSpec.describe 'chef show page' do
  before(:each) do
    @louis = Chef.create!(name: 'Chef Louis')
    
    visit chef_path(@louis)
  end 

  it 'displays name of chef' do
    expect(page).to have_content(@louis.name)
  end

  it 'has link to view ingredients' do 
    click_link("View #{@louis.name}'s' Ingredients")
    expect(current_path).to eq(chef_ingredients_path(@louis.id))
    
  end
end