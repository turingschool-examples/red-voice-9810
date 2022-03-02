require 'rails_helper'

RSpec.describe DishIngredient, type: :model do

  describe 'relationships' do
    it {should belong_to :ingredient}
    it {should belong_to :dish}
  end
  #
  # before :each do
  #
  # end
  #
  # describe 'Class Methods' do
  #  describe '#' do
  #   it will '' do
  #
  #   end
  #  end
  # end
  #
  # describe 'Instance Methods' do
  #  describe '.' do
  #   it will '' do
  #   end
  #  end
  # end
end
