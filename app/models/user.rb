class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end

  validates :name, presence: true, length: { maximum: 50 }
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }  
end
