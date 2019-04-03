class Api::V1::CommentsController < ApplicationController

  def index
    @comments = Comment.all
    render json: @comments, status: 200
  end

  def create
    comment = Comment.create(comment_params)
    render json: listing, status: 201
  end

  def update
    @comment.update(comment_params)
    render json: @comment, status: 200
  end

  def destroy
    commentId = @comment.id
    @comment.destroy
    render json: {message: "comment deleted", commentId:commentId}
  end

  private
  def comment_params
    params.permit(:user_id, :listing_id, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
