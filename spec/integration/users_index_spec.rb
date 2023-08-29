require 'rails_helper'
RSpec.describe 'User #index page content', type: :feature do
  before(:each) do
    @user1 = User.create(name: 'Salomon T', photo: 'https://image1.jpg',
                         bio: 'Micronaute', posts_counter: 3)
    @user2 = User.create(name: 'Chere L', photo: 'https://image2.jpg',
                         bio: 'Micraunote', posts_counter: 5)
    visit users_path
  end
  it 'It should display the name of all users' do
    page.has_content?(@user1.name)
    page.has_content?(@user2.name)
  end
  it 'It should display the photo of all users' do
    page.has_css?("img[src*='https://image1.jpg']")
    page.has_css?("img[src*='https://image2.jpg']")
  end
  it 'It should show the number of posts for each user.' do
    expect(page).to have_content(@user1.posts_counter)
    expect(page).to have_content(@user2.posts_counter)
  end
  it 'When a user is clicked, it should redirect to that users show page.' do
    click_on @user2.name
    expect(current_path).to eq("/users/#{@user2.id}")
  end
end
