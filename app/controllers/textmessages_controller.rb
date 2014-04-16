class TextmessagesController < ApplicationController

  def create
    @textmessage = current_user.textmessages.build(textmessage_params)
    if @textmessage.save
      redirect_to houses_path, notice: 'Textmessage Alert Added'
    else
      # redirect_to house_path(@rating.house), notice: "Error: rating was not added"

      redirect_to :back, alert: 'Textmessage Alert Not Added'
    end
  end

  def update
    @textmessage = Textmessage.find(params[:id])
    respond_to do |format|
      if @textmessage.update(textmessage_params)
        format.html { redirect_to house_path, notice: 'Textmessage Alert was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @textmessage.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def textmessage_params
    params.require(:textmessage).permit(:date_time, :phone_number).merge(user: current_user, house_id: params[:house_id])
  end

end
