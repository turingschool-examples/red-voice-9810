require 'rails_helper'

RSpec.describe Ingredient, type: :model do

  describe 'relationships' do
    it {should have_many :dish_ingredients}
    it {should have_many(:dishes).through(:dish_ingredients)}
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
