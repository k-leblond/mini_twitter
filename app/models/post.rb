class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  # validates :content, length: { maximum: 140 }
  validates :content, length: { minimum: 6 }
  validates :user, presence: true
end
