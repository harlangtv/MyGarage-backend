class Api::V1::BidsController < ApplicationController

  def index
    @bids = bid.all
    render json: @bids, status: 200
  end

  def create
    bid = bid.create(bid_params)
    render json: listing, status: 201
  end

  def update
    @bid.update(bid_params)
    render json: @bid, status: 200
  end

  def destroy
    bidId = @bid.id
    @bid.destroy
    render json: {message: "bid deleted", bidId:bidId}
  end

  private
  def bid_params
    params.permit(:auction_id, :user_id, :bid_amount)
  end

  def set_bid
    @bid = bid.find(params[:id])
  end
end
