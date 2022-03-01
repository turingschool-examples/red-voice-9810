require 'rails_helper'

RSpec.describe 'dishes show page' do
  describe 'story #1' do
    it "shows the dish name, description, the list of ingredients and chef's name" do
      ramsay = Chef.create!(name: "Gordon Ramsay")
      wellington = Dish.create!(name: "Beef Wellington", description: "Beef Wellington is a steak dish of English origin, made out of fillet steak coated with pâté and duxelles, wrapped in puff pastry, then baked.")

      ingredient_1 = Ingrdient.create!(name: "Puff Pastry")
      ingredient_2 = Ingrdient.create!(name: "Filet Tenderloin")
      ingredient_3 = Ingrdient.create!(name: "Mushrooms")
      ingredient_4 = Ingrdient.create!(name: "Rosemary")

      visit "/dishes/#{dish.id}"

      expect(page).to have_content(wellington.name)
      expect(page).to have_content(wellington.description)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_3.name)
      expect(page).to have_content(ingredient_4.name)

    end
  end

end
