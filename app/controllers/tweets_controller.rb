class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new   #新規投稿用の空のインスタンス
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def index
    @tweets = Tweet.all
  end

  def create
  end
end
