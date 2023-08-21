require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET posts#index' do
    it 'returns http success' do
      get '/users/1/posts'
      expect(response.status).to eq(200)
    end
  end

  describe 'GET posts#show' do
    it 'returns http success' do
      get user_post_path(1, 1)
      expect(response.status).to eq(200)
    end
  end

  describe 'Template rendering' do
    it 'renders the /posts#index template' do
      get user_posts_path(1)
      expect(response).to render_template('index')
    end

    it 'renders the /posts#show template' do
      get user_post_path(1, 1)
      expect(response).to render_template('show')
    end
  end

  describe 'response body' do
    it 'contains correct /posts#index/ palceholder text' do
      get user_posts_path(1)
      expect(response.body).to include('Here is a list of posts with all comments for a given user')
    end

    it 'contains correct /posts#show/ palceholder text' do
      get user_post_path(1, 1)
      expect(response.body).to include('Here is a post with list of comments for a given user')
    end
  end
end
