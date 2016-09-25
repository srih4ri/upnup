class PhotosController < ApplicationController

  before_action :authenticate_person!, only: [:new]

  def index
    @photos = Photo.all.order(altitude: :desc).page
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.person = current_person
    if @photo.save
      flash[:message] = "Your photo was added!"
      redirect_to photos_path
    else
      flash[:message] = "Please check that photo again"
      render :new
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
