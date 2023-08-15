# spec/model/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'John Doe', posts_counter: 10)
  before { user.save }
  post = Post.new(title: 'Post Title', author: user, comments_counter: 10, likes_counter: 5)
  before { post.save }

  it 'is valid with valid attributes' do
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'is not valid without a author' do
    post.author = nil
    expect(post).to_not be_valid
  end

  before { post.author = user }

  it 'is not valid with a title longer than 250 characters' do
    post.title = ('a' * 251)
    expect(post).to_not be_valid
  end

  it 'is valid with a title of 250 characters or less' do
    post.title = ('a' * 250)
    expect(post).to be_valid
    post.title = ('a' * 40)
    expect(post).to be_valid
    post.title = ('a' * 1)
    expect(post).to be_valid
  end

  it 'is not valid with a negative comments_counter' do
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'is valid with a comments_counter of 0 or greater' do
    post.comments_counter = 0
    expect(post).to be_valid
    post.comments_counter = 8
    expect(post).to be_valid
  end

  it 'is not valid with a negative likes_counter' do
    post.likes_counter = -1
    expect(post).to_not be_valid
  end

  it 'is valid with a likes_counter of 0 or greater' do
    post.likes_counter = 0
    expect(post).to be_valid
    post.likes_counter = 13
    expect(post).to be_valid
  end

  it 'is valid with a recent_comments method that returns 5 comments or less' do
    expect(post.recent_comments.count).to be <= 5
  end

  it 'is not valid with a recent_comments method that returns more than 5 comments' do
    expect(post.recent_comments.count).to_not be > 5
  end

  it 'is not valid with a recent_comments method that returns negative comments' do
    expect(post.recent_comments.count).to_not be < 0
  end

  it 'is valid with a recent_likes method that returns 5 likes or less' do
    expect(post.recent_likes.count).to be <= 5
  end

  it 'is not valid with a recent_likes method that returns more than 5 likes' do
    expect(post.recent_likes.count).to_not be > 5
  end

  it 'is not valid with a recent_likes method that returns negative likes' do
    expect(post.recent_likes.count).to_not be < 0
  end

  it 'is valid with a update_posts_counter method that returns 1 post' do
    user.posts_counter = 10
    post.update_posts_counter
    expect(user.posts_counter).to be == 11
  end
end
