class HousesController < ApplicationController
  before_filter :authenticate_user!,
    :only => [:destroy, :create, :edit, :new, :search]
  def new
    @house = House.new
  end

  def index
    if user_signed_in?
      @houses = current_user.houses
    else
    end
  end

  def search
    api_results = Zillow.new(params[:address], params[:citystatezip])
    @house = current_user.houses.build(price: api_results.price, town: api_results.city, bedrooms: api_results.bedrooms, bathrooms: api_results.bathrooms, url: api_results.url, address: api_results.street_address, remote_image_url: api_results.image_url, description: api_results.description  )
    if @house.save
      redirect_to houses_path, notice: 'House Added'
    else
      flash.now[:error] = 'House Not Added'
      render :new
    end
  end


#     @price = (@response["searchresults"]["response"]["results"]["result"]["zestimate"]["amount"]["__content__"]).to_i
#     @street_address = @response["searchresults"]["response"]["results"]["result"]["address"]["street"]
#     @zip = @response["searchresults"]["response"]["results"]["result"]["address"]["zipcode"]
#     @city = @response["searchresults"]["response"]["results"]["result"]["address"]["city"]
#     @state = @response["searchresults"]["response"]["results"]["result"]["address"]["state"]
#     @bedrooms = @response["searchresults"]["response"]["results"]["result"]["bedrooms"]
#     @bathrooms = @response["searchresults"]["response"]["results"]["result"]["bathrooms"]
#     @url

  #  create_table "houses", force: true do |t|
  #   t.integer  "price"
  #   t.string   "town"
  #   t.text     "description"
  #   t.integer  "bedrooms"
  #   t.integer  "bathrooms"
  #   t.datetime "created_at"
  #   t.datetime "updated_at"
  #   t.integer  "user_id"
  #   t.string   "url"
  #   t.string   "address"
  #   t.integer  "rating"
  #   t.string   "image"
  # end

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

