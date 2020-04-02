class CommentsController < ApplicationController
  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new
  end

  def index
    @tweet = Tweet.find(params[:tweet_id])
    @comments = Tweet.find(params[:tweet_id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    Comment.create(comment_params)
    redirect_to tweets_path
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(tweet_id: params[:tweet_id])
  end
end
