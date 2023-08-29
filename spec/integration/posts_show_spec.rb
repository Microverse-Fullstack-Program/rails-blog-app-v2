require 'rails_helper'
RSpec.describe 'Post #show page test', type: :feature do
  before(:each) do
    @user = User.create(name: 'Chere L', photo: 'https://image.jpg',
                        bio: 'Micronaute', posts_counter: 7)
    @post = Post.create(author: @user, title: 'test post', text: 'This is my first post', likes_counter: 3,
                        comments_counter: 5)
    @comment = Comment.create(post_id: @post.id, author_id: @user.id, text: 'test comment')

    visit user_post_path(@user, @post)
  end

  it 'It should display the post title' do
    page.has_content?(@post.title)
  end

  it 'It should display the post author.' do
    page.has_content?(@post.author)
  end

  it 'It should display the count of comments of the post' do
    page.has_content?(@post.comments_counter)
  end

  it 'It should display the count of likes of the post' do
    page.has_content?(@post.likes_counter)
  end

  it 'It should display the post body.' do
    page.has_content?(@post.text)
  end

  it 'It should display the author of each commentor.' do
    page.has_content?(@comment.author.name)
  end

  it 'It should display the comment of each commentor.' do
    page.has_content?(@comment.text)
  end

  it 'It should show the button to like a post.' do
    page.has_content?('👍')
  end

  it 'It should show the button to create a new comment.' do
    page.has_content?('Add Comment')
  end

  it 'When the button to create a new comment is clicked, it should redirect to the new comment page.' do
    page.first(:link, 'Add Comment').click
    expect(current_path).to eq(new_user_post_comment_path(@user, @post))
  end
end
