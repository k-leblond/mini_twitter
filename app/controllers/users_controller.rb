class UsersController < ApplicationController
  before_action :user_find, only: %i[show followings followers]

  def index
    @users = User.all
  end

  def show
  end

  def following

  end

  def followers
  end

  private

  def user_find
    @user = User.find(params[:id])
  end

end
