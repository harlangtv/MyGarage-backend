class Api::V1::ImagesController < ApplicationController

  def index
   @images = Image.all
   render json: @images
 end

 def show
   @image = Image.find(params[:id])
   render json: @image
 end

 def update
   @image.update(image_params)
   if @image.save
     render json: @image, status: :accepted
   else
     render json: { errors: @image.errors.full_messages }, status: :unprocessible_entity
   end
 end

 private

 def note_params
   params.permit(:image_url)
 end

 def find_image
   @image = Image.find(params[:id])
 end
end
