class IngredientsController < ApplicationController

  #Because there is no current ingredients controller, it appears our route
  #defaults here. Naming conventions are weird, but since I need only this chef
  #ingredients, I only need to instantiate @chef here. Is this best practice?

  #Should I have used the other routing convention to get chef/ingredients in
  #the proper directory format? Should I have made an AR method for finding a
  #Chef's ingredients, rather than building into the relationship and using distinct?

  def index
    @chef = Chef.find(params[:chef_id])
  end
end
