class CommentsController < ApplicationController
  before_action :set_comment, only: %I[new edit create update destroy]

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    if user_signed_in?
      @comment.user_id = current_user.id
    else
      @comment.user_id = 0
    end
    @comment.save
    redirect_to tweet_path(@tweet)
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to tweet_path(@tweet)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to tweet_path(@tweet)
  end

  private

  def set_comment
    @tweet = Tweet.find(params[:tweet_id])
  end

  def comment_params
    params.require(:comment).permit(:content).merge(tweet_id: params[:tweet_id])
  end
end
