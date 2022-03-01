class Chef::ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
  end


end
