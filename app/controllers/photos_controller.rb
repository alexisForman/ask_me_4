class PhotosController < ApplicationController

  def index

  end

  def new
      @photo = Photo.new
  end

  # def create
  #     # @photo = session[:current_user].photo.build(photo_params)
  #     @photo = Photo.new(photo_params)
  #   if @photo.save
  #     flash[:notice] = "Photos uploaded successfully"
  #     redirect_to user_path
  #   else
  #     flash[:errors] = @photo.errors.full_messages
  #     render :new, status: :unprocessable_entity
  #   end 
  # end

  def create

    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to photo_url(@photo), notice: "Photo was successfully created." }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  private
  def photo_params
      params.require(:photo).permit(:good_path, :image_good_path, :ordinary_path, :image_ordinary_path, :bad_path, :image_bad_path, :user_id)
  end
end

