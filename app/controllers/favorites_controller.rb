class FavoritesController < ApplicationController
  authorize_resource

  def index
    @tweets = current_user.favorite_tweets
  end

  def create
    favorite = current_user.favorites.create(tweet_id: params[:tweet_id])
    @tweet = favorite.tweet
  end

  def destroy
    favorite = Favorite.find_by(tweet_id: params[:tweet_id], user_id: current_user.id)
    favorite.destroy
    @tweet = favorite.tweet
  end
end
