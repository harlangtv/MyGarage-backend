class Api::V1::AuctionsController < ApplicationController

  def index
    @auctions = Auction.all
    render json: @auctions, status: 200
  end

  def show
    @auction = Auction.find(params[:id])
    render json: @auction, status: 200
  end

  def create
    auction = Auction.create(auction_params)
    render json: listing, status: 201
  end

  def update
    @auction.update(auction_params)
    render json: @auction, status: 200
  end

  def destroy
    auctionId = @auction.id
    @auction.destroy
    render json: {message: "auction deleted", auctionId:auctionId}
  end

  private
  def auction_params
    params.permit(:listing_id, :starting_price, :current_bid, :auction_end, :auction_active)
  end

  def set_auction
    @listing = Auction.find(params[:id])
  end
end
