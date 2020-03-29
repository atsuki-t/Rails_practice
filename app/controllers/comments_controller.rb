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
    @comment = @tweet.comments.create(comment_params)
    @comment.save
    redirect_to tweets_path
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
