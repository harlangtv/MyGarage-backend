class Api::V1::ImagesController < ApplicationController

  def index
   @images = Image.all
   render json: @images
 end

 def show
   @image = Image.find(params[:id])
   render json: @image
 end

 def create
   @image = Image.new(image_params)
     if @image.save
       render json: @image.listing, status: 200
   end
 end

 def update
   @image.update(image_params)
   if @image.save
     render json: @image.listing, status: 200
   end
 end

 private

 def image_params
   params.permit(:listing_id, :image_url)
 end

 def find_image
   @image = Image.find(params[:id])
 end
end
