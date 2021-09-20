class UsersController < ApplicationController
  before_action :set_user, only: %I[show edit update]
  authorize_resource

  def index
    @users = User.all
    @user = if user_signed_in?
              current_user.user_name
            else
              'ゲスト'
            end
  end

  def show
    @favorite_tweets = @user.favorite_tweets
    @tweets = @user.tweets.reverse
  end

  def edit; end

  def update
    @user.update(user_params)
    redirect_to user_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :user_name, :introduction, :image)
  end
end
