require 'rails_helper'

describe Ingredient do
  it { should have_many(:dish_ingredients) }
  it { should have_many(:dishes).through(:dish_ingredients) }
end
