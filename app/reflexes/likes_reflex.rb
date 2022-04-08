# frozen_string_literal: true
class LikesReflex < ApplicationReflex

  def upvote
    post = Post.find(element.dataset[:id])
    like_find = Like.find_by(post: post, user: current_user)
    if like_find
      like_find.destroy
    else
      like = Like.new
      like.post = post
      like.user = current_user
      like.save!
    end

  end

end
