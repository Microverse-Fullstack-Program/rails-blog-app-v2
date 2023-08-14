class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_posts_counter
  after_destroy :update_posts_counter
  
  def update_posts_counter
    if destroyed?
      author.decrement!(:posts_counter)
      return
    end
    author.increment!(:posts_counter)
  end
  
  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end

  def recent_likes(limit = 3)
    likes.order(created_at: :desc).limit(limit)
  end
end
