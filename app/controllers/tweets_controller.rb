class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new # 新規投稿用の空のインスタンス
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = @tweet.user
  end

  def index
    @tweets = Tweet.all
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    redirect_to tweets_path
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    redirect_to tweets_path
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path
  end

  private

    def tweet_params
      params.require(:tweet).permit(:body, :title)
    end
end
