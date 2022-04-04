# frozen_string_literal: true

class LikeReflex < ApplicationReflex

  def like
    post = Post.find(element.dataset[:id])
    post.likes.find_or_create_by(user: current_user)
  end

end
