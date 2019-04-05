class Api::V1::ListingsController < ApplicationController
  # before_action :set_storage_url, except: [:destroy]

  def index
    @listings = Listing.all
    render json: @lsitings, status: :ok
  end

  def create
    @listing = Listing.create(listing_params)
    render json: {
      vehicle_make: @listing.vehicle_make,
      vehicle_model: @listing.vehicle_model,
      vehicle_year: @listing.vehicle_year,
      mileage: @listing.mileage,
      vehicle_zip_code: @listing.vehicle_zip_code,
      transmission: @listing.transmission,
      vehicle_description: @listing.vehicle_description,
    }
  end

  def show
    @listing = Listing.find(params[:id])
    render json: {
      vehicle_make: @listing.vehicle_make,
      vehicle_model: @listing.vehicle_model,
      vehicle_year: @listing.vehicle_year,
      mileage: @listing.mileage,
      vehicle_zip_code: @listing.vehicle_zip_code,
      transmission: @listing.transmission,
      vehicle_description: @listing.vehicle_description,
    }
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
    params.permit(:vehicle_make, :vehicle_model, :vehicle_year, :country, :mileage, :vehicle_zip_code, :transmission, :vehicle_description)
  end

end
