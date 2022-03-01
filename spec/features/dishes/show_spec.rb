require 'rails_helper'

RSpec.describe 'Dish Show Page' do
  before :each do

  end

  it "shows dishes attributes" do
    visit "/dishes/#{@dish_1.id}"

    expect(page).to have_content("#{@dish_1.name}")
    expect(page).to have_content("#{@dish_1.description}")

    expect(page).to have_content("#{@ingredient_1.name}")
    expect(page).to have_content("#{@ingredient_2.name}")

    expect(page).to have_content("#{@chef_1.name}")
  end
end
