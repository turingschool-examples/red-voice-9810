class ChefsController < ApplicationController

  def show
    @chef = Chef.find(params[:id])
  end
end



# Customer.select(:last_name).distinct
