require 'rails_helper'

RSpec.describe 'Post #index page test', type: :feature do
  before(:each) do
    @user = User.create(name: 'Chere L', photo: 'https://image.jpg',
                        bio: 'Micronaute', posts_counter: 7)
    @post = Post.create(author: @user, title: 'test post', text: 'This is my first post', likes_counter: 3,
                        comments_counter: 5)
    @comment = Comment.create(post_id: @post.id, author_id: @user.id, text: 'test comment')

    visit user_posts_path(@user)
  end

  it 'It should display the user profile' do
    page.has_content?(@user.photo)
  end

  it 'It should display the username' do
    page.has_content?(@user.name)
  end

  it 'It should display the number of posts of the user' do
    page.has_content?(@user.posts_counter)
  end

  it 'It should display the titles of the posts' do
    page.has_content?(@post.title)
  end

  it 'It should display the text of the post' do
    page.has_content?(@post.text)
  end

  it 'It should display the comments of all the posts.' do
    page.has_content?(@post.comments)
  end

  it 'It should display the count of comments of each post' do
    page.has_content?(@post.comments_counter)
  end

  it 'It should display the count of likes of each post' do
    page.has_content?(@post.likes_counter)
  end

  it 'It should show the button to like a post.' do
    page.has_content?('👍')
  end

  it 'It should show the pagination button' do
    page.has_content?('Pagination')
  end

  it 'It should display the button to create a new post' do
    page.has_content?('New Post')
  end
  
  it 'When the button to create a new post is clicked, it should redirect to the new post page.' do
    page.first(:link, 'New Post').click
    expect(current_path).to eq(new_user_post_path(@user))
  end

  it 'When the post is clicked, it should redirect to the post page.' do
    find(:css, '.post-link').click
    expect(current_path).to eq(user_post_path(@user.id, @post.id))
  end
end