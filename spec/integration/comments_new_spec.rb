require 'rails_helper'
RSpec.describe 'Comment #new page test', type: :feature do
  before(:each) do
    @user = User.create(name: 'Chere L', photo: 'https://image.jpg',
                        bio: 'Micronaute', posts_counter: 7)
    @post = Post.create(author: @user, title: 'test post', text: 'This is my first post',
                        likes_counter: 3, comments_counter: 5)

    visit new_user_post_comment_path(@user, @post)
  end

  it 'It should display the title of the form to create a new comment' do
    page.has_content?('New Comment')
  end

  it 'It should show the comment text field' do
    page.has_css?('comment_text')
    expect(page).to have_field('comment_text')
  end

  it 'It should display the button to create a new post' do
    page.has_content?('Create')
  end

  it 'It should save new post' do
    fill_in 'comment_text', with: 'test comment'
    click_on 'Create'
    expect(current_path).to eq(user_post_path(@user, @post))
    expect(page).to have_content('Comment was successfully created.')
  end

  it 'It should display the button to cancel the creation of a new post' do
    page.has_content?('Cancel')
  end

  it 'When the button to cancel the creation of a new post is clicked, it should redirect to the user posts page.' do
    click_on 'Cancel'
    expect(current_path).to eq(user_post_path(@user, @post))
  end
end
