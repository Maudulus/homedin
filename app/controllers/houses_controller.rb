class HousesController < ApplicationController

  def new
    @house = House.new
  end

  def foobar
    @house = House.find(params[:id])

    redirect_to house_path(@house)
  end

  def create
    @house = House.create(house_params)
      if @house.save
        redirect_to houses_path, notice: 'House Added'
      else
        redirect_to new_house_path, notice: "Error: house was not added"
      end
  end


   protected
  def house_params
    params.require(:house).permit(:price, :town, :description, :bedrooms,:bathrooms, :url)
  end
end

