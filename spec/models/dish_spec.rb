require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  describe "instance methods" do
    it 'returns chef name' do
      chef_1 = Chef.create!(name: "Nick Smith")
      dish_1 = Dish.create!(name: "Eggs Benedict", description: "Eggs on eggs on ham on bread" , chef_id: chef_1.id)
      expect(dish_1.get_chef_name).to eq("Nick Smith")
    end
  end
end
