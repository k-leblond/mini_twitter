class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @post = Post.new
    following_ids = current_user.following.ids+[current_user.id]
    @posts = Post.where(user_id: following_ids).paginate(page: params[:page], per_page: 2)
  end

end
