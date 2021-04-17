class TweetsController < ApplicationController
  before_action :set_tweet, only: %I[show edit update destroy]

  def new
    @tweet = Tweet.new
  end

  def show
    @user = @tweet.user
    @user_name = if user_signed_in?
                   current_user.user_name
                 else
                   'ゲスト'
                 end
    @comment = Comment.new
  end

  def index
    @tweets = Tweet.all.order(id: :DESC)
    @user_name = if user_signed_in?
                   current_user.user_name
                 else
                   'ゲスト'
                 end
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path
    else
      render new_tweet_path
    end
  end

  def edit; end

  def update
    @tweet.update(tweet_params)
    redirect_to tweets_path
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:body, :title)
  end
end
