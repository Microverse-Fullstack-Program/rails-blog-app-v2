#spec/model/comment_spec.rb
require 'rails_helper'

RSpec.describe Comment, type: :model do
  user1 = User.new(name: 'John Doe', posts_counter: 4)
  user2 = User.new(name: 'Jane Doe', posts_counter: 5)
  user3 = User.new(name: 'Jack Doe', posts_counter: 6)
  before { user1.save && user2.save && user3.save}

  post = Post.new(title: 'Post Title', author: user1, comments_counter: 10, likes_counter: 0)

  before { post.save }

  comment1 = Comment.new(author: user2, post: post)
  comment2 = Comment.new(author: user3, post: post)

  before {comment1.save && comment2.save}

  it 'is valid with update_comments_counter method that returns 2 comments' do
    comment2.update_comments_counter
    expect(post.comments_counter).to eq(2)
  end
end
