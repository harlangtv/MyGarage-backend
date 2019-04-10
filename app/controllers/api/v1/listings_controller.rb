class Api::V1::ListingsController < ApplicationController

  def index
    @listings = Listing.all
    render json: @listings, status: :ok
  end

  def create
    @listing = Listing.create(listing_params)
    @post.images.build
    render json: @listing
  end

  def show
    @listing = Listing.find(params[:id])
    render json: @listing, include: :user
  end

  def update
    @listing.update(listing_params)
    render json: @listing, status: 200
  end

  def destroy
    listingId = @listing.id
    @listing.destroy
    render json: {message: "listing deleted", listingId:listingId}
  end

  private
  def listing_params
    params.permit(:user_id, :vehicle_make, :vehicle_model, :vehicle_year, :country, :mileage, :vehicle_zip_code, :transmission, :vehicle_description)
  end



end
