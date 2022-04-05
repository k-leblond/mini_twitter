# frozen_string_literal: true

class LikesReflex < ApplicationReflex

  def upvote
    post = Post.find(element.dataset[:id])
    post.find_or_create_by(user: current_user)
    if post.find
      post.destroy
    else
      post.like.user = current_user
      post.save!
    end

  end

end
