class PhotosController < ApplicationController

  def index
    @photos = Photo.all.page
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.person = Person.srihari
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
