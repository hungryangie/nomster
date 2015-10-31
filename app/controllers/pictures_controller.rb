class PicturesController < ApplicationController
	before_action :authenticate_user!
	def create
		@place = Place.find(params[:place_id])
		@place.pictures.create(picture_params(:user => current_user))
    redirect_to place_path(@place)
	end

	private

	def picture_params
    params.require(:picture).permit(:caption, :picture, :place_id)
  end
end
