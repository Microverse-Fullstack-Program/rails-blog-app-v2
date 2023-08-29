require 'rails_helper'
RSpec.describe 'Post #new page test', type: :feature do
  before(:each) do
    @user = User.create(name: 'Chere L', photo: 'https://image.jpg', bio: 'Micronaute', posts_counter: 7)

    visit new_user_post_path(@user)
  end

  it 'It should display the title of the form to create a new post' do
    page.has_content?('New Post')
  end

  it 'It should display the title field lable' do
    page.has_content?('Title')
  end

  it 'It should show the title text field' do
    page.has_css?('post_title')
    expect(page).to have_field('post_title')
  end

  it 'It should display the text field label' do
    page.has_content?('Text')
  end

  it 'It should display the text field' do
    page.has_css?('post_text')
    expect(page).to have_field('post_text')
  end

  it 'It should display the button to create a new post' do
    page.has_content?('Create')
  end

  it 'It should save new post' do
    fill_in 'Title', with: 'test post'
    fill_in 'Text', with: 'This is my first post'
    click_on 'Create'
    expect(current_path).to eq(user_path(@user))
    expect(page).to have_content('Post was successfully created.')
  end

  it 'It should display the button to cancel the creation of a new post' do
    page.has_content?('Cancel')
  end

  it 'When the button to cancel the creation of a new post is clicked, it should redirect to the user posts page.' do
    click_on 'Cancel'
    expect(current_path).to eq(user_path(@user))
  end
end
