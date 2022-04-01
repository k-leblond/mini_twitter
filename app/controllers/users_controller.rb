class UsersController < ApplicationController
  before_action :user_find, only: %i[show followings followers]

  def index
    @users = User.all
  end

  def show
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

end
