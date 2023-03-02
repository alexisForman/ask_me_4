class PhotosController < ApplicationController
  def new
      @photo = Photo.new
  end

  def create
      # @photo = session[:current_user].photo.build(photo_params)
      @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Photos uploaded successfully"
     
      # redirect_to user_path(@user[:id])
    else
      flash[:notice] = "Upload failed."
      render :new, status: :unprocessable_entity
    end 
  end

  def show

  end

  private
  def photo_params
      params.require(:photo).permit(:good_path, :bad_path, :ordinary_path, :user_id)
  end
end

