class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @post = Post.new
    @posts = Post.all
  end

end
