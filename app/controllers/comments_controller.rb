class CommentsController < ApplicationController
  before_action :set_comment, only: %I[edit create update destroy]
  authorize_resource

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = if user_signed_in?
                         current_user.id
                       else
                         0
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
