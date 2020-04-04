class CommentsController < ApplicationController
  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new
  end

  def edit
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.find(params[:id])
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to tweet_path(@tweet)
  end

  def update
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to tweet_path(@tweet)
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to tweet_path(@tweet)
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(tweet_id: params[:tweet_id])
  end
end
