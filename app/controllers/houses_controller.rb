class HousesController < ApplicationController

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)
      if @house.save
        redirect_to new_house_path, notice: 'House Added'
      else
        redirect_to new_house_path, notice: "Error: house was not added"
      end
  end


   protected
  def house_params
    params.require(:house).permit(:price, :town, :description, :bedrooms,:bathrooms, :url)
  end
end

