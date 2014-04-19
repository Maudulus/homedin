class RatingsController < ApplicationController

  def create
    @rating = current_user.ratings.build(rating_params)
    if @rating.save
      redirect_to houses_path, notice: 'Rating Added'
    else
      # redirect_to house_path(@rating.house), notice: "Error: rating was not added"
      flash.now[:error] = 'Rating Not Added'
      render :show
    end
  end

  def update
    @rating = Rating.find(params[:id])
    respond_to do |format|
      if @rating.update(rating_params)
        format.html { redirect_to houses_path, notice: 'House Rating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:value).merge(user: current_user, house_id: params[:house_id])
  end
end
