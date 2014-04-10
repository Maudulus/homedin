class HousesController < ApplicationController

  def new
    @house = House.new
  end

  def index
    @houses = House.all
  end

  def foobar
    @house = House.find(params[:id])

    redirect_to house_path(@house)
  end

  def edit
    @house = House.find(params[:id])
  end

  def show
    @house = House.find(params[:id])
  end

  def create
    @house = House.create(house_params)
      if @house.save
        redirect_to houses_path, notice: 'House Added'
      else
        redirect_to new_house_path, notice: "Error: house was not added"
      end
  end

  def update
    @house = House.find(params[:id])
    respond_to do |format|
      if @house.update(house_params)
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @house = House.find(params[:id])
    @house.delete
    redirect_to houses_path
  end

   protected
  def house_params
    params.require(:house).permit(:price, :town, :description, :bedrooms,:bathrooms, :url, :rating, :remote_image_url, :image)
  end
end

