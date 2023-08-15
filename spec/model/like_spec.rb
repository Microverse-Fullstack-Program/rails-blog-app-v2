#spec/model/like_spec.rb
require 'rails_helper'

RSpec.describe Like, type: :model do
  user1 = User.new(name: 'John Doe', posts_counter: 4)
  user2 = User.new(name: 'Jane Doe', posts_counter: 5)
  user3 = User.new(name: 'Jack Doe', posts_counter: 6)
  before { user1.save && user2.save && user3.save}

  post = Post.new(title: 'Post Title', author: user1, comments_counter: 10, likes_counter: 0)

  before { post.save }

  like1 = Like.new(author: user2, post: post)
  like2 = Like.new(author: user3, post: post)

  before {like1.save && like2.save}

  it 'is valid with update_likes_counter method that returns 2 likes' do
    like2.update_likes_counter
    expect(post.likes_counter).to eq(2)
  end
  
end