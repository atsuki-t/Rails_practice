class CommentsController < ApplicationController
  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to tweet_path(@tweet)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(tweet_id: params[:tweet_id])
  end
end
