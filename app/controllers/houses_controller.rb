class HousesController < ApplicationController
  before_filter :authenticate_user!,
    :only => [:destroy, :create, :edit, :new]
  def new
    @house = House.new
  end

  def index
    if user_signed_in?
      @houses = current_user.houses
    else
    end
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
    @rating = Rating.find_by(house: @house, user: current_user) || Rating.new
    @textmessage = Textmessage.find_by(house: @house, user: current_user) || Textmessage.new
  end

  def create
    @house = current_user.houses.build(house_params)
      if @house.save
        redirect_to houses_path, notice: 'House Added'
      else
        flash.now[:error] = 'House Not Added'
        render :new
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

  def send_text_messages
    # TODO error handling, etc.
    MessageWorker.perform_async(@contact_group.id, params[:message])
    flash[:notice] = "#{@contact_group.contacts.count} text messages queued " +
                     "to be sent."
    redirect_to contact_group_path(@contact_group)
  end

  def destroy
    @house = House.find(params[:id])
    @house.delete
    redirect_to houses_path
  end

  # def set_user
  #   @user = current_user
  # end

   protected
  def house_params
    params.require(:house).permit(:price, :town, :description, :bedrooms,:bathrooms, :url, :rating, :remote_image_url, :image, :textmessage )
  end
end

