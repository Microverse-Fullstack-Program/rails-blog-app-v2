require 'rails_helper'
RSpec.describe 'User #show page content', type: :feature do
  before(:each) do
    @user = User.create(name: 'Chere L', photo: 'https://image.jpg',
                        bio: 'Micraunote', posts_counter: 5)
    @post1 = Post.create(title: 'test post-1', text: 'test text-1', comments_counter: 1,
                         likes_counter: 3, author_id: @user.id)
    @post2 = Post.create(title: 'test post-2', text: 'test text-2', comments_counter: 2,
                         likes_counter: 2, author_id: @user.id)
    @post3 = Post.create(title: 'test post-3', text: 'test text-3', comments_counter: 1,
                         likes_counter: 1, author_id: @user.id)
    visit user_path(@user)
  end
  it 'It should display the name of the user' do
    page.has_content?(@user.name)
  end
  it 'It should display the profile picture of the user' do
    page.has_css?("img[src*='https://image.jpg']")
  end
  it 'It should show the number of posts for the user.' do
    page.has_content?(@user.posts_counter)
  end
  it 'It should display the bio of the user' do
    page.has_content?(@user.bio)
  end
  it 'It should display the user three recent/last posts' do
    recent = @user.recent_posts
    recent.each do |post|
      page.has_content?(post.text)
    end
  end
  it 'It should display the number of comments for each post.' do
    page.has_content?(@post1.comments_counter)
    page.has_content?(@post2.comments_counter)
    page.has_content?(@post3.comments_counter)
  end
  it 'It should display the number of likes for each post.' do
    page.has_content?(@post1.likes_counter)
    page.has_content?(@post2.likes_counter)
    page.has_content?(@post3.likes_counter)
  end
  it 'It should show the button to like a post.' do
    page.has_content?(':+1:')
  end
  it 'It should display the button that lets to view all of a user posts.' do
    page.has_content?('See All Posts')
  end
  it 'It should display the button to create a new post' do
    page.has_content?('New Post')
  end
  it 'When the button to create a new post is clicked, it should redirect to the new post page.' do
    page.first(:link, 'New Post').click
    expect(current_path).to eq(new_user_post_path(@user))
  end
  it 'When the button to view all of a user posts is clicked, it should redirect to the user posts page.' do
    page.first(:link, 'See All Posts').click
    expect(current_path).to eq(user_posts_path(@user, @posts))
  end
end
