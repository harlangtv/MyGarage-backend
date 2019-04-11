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
   # byebug
   # @image = Image.new(params[:images])
     if @image.save
       render json: @image, status: 200
   # Step 1: Create a new listing

   # Step 2: Create a new image associated with the newly created listing

   # Step 3: Persist both to the database and render JSON of the listing
   end
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

 def image_params
   params.permit(:listing_id, :image_url)
 end

 def find_image
   @image = Image.find(params[:id])
 end
end
