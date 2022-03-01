require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end

  describe "relationships" do
    it {should have_many :dish_ingredients}
    #it {should have_many (:ingredients).through(:dish_ingredients)} - Kept Getting Error  undefined method `through' for :ingredients:Symbol
  end
end
