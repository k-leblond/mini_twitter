class PostsController < ApplicationController
  before_action :post_find, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save!
    if @post.save!
      flash[:notice] = "Your post has been submitted"
        (current_user.followers + [current_user]).each { | user |
        FeedChannel.broadcast_to(
          user,
          render_to_string(partial: "post", locals: { post: @post })
          )
      }
    else
      flash[:alert] = "Something went wrong"
    end
  end

  def destroy
    @post.destroy
  end

  private

  def post_find
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
