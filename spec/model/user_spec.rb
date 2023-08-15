#spec/model/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'John Doe', posts_counter: 10)
  before { user.save }

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'is not valid with a name longer than 50 characters' do
    user.name = ('a' * 51)
    expect(user).to_not be_valid
  end

  it 'is valid with a name of 50 characters or less' do
    user.name = ('a' * 50)
    expect(user).to be_valid

    user.name = ('a' * 40)
    expect(user).to be_valid
  end

  it 'is valid with a name of 1 character' do
    user.name = 'a'
    expect(user).to be_valid
  end

  it 'is not valid with a negative posts_counter' do
    user.posts_counter = -1
    expect(user).to_not be_valid
  end

  it 'is valid with a posts_counter of 0 or greater' do
    user.posts_counter = 0
    expect(user).to be_valid

    user.posts_counter = 11
    expect(user).to be_valid
  end

  it 'is valid with a recent_posts method that returns 3 posts or less' do
    expect(user.recent_posts.count).to be <= 3
  end

  it 'is not valid with a recent_posts method that returns more than 3 posts' do
    expect(user.recent_posts.count).to_not be > 3
  end

  it 'is not valid with a recent_posts method that returns negative posts' do
    expect(user.recent_posts.count).to_not be < 0
  end
end