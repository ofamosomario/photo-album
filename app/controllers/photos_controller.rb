# frozen_string_literal: true

# Photos Controller
class PhotosController < ApplicationController
  def index
    @photos = Photo.all

    render json: @photos
  end

  def create
    @photo = Photos::CreateService.call(photo_params)
    if @photo.save
      render json: @photo, status: :created
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end
end
