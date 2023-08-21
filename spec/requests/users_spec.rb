require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Template rendering' do
    it 'renders the /Users#index template' do
      get users_path
      expect(response).to render_template('index')
    end

    it 'renders the /Users#show template' do
      get user_path(1)
      expect(response).to render_template('show')
    end
  end

  describe 'response body' do
    it 'contains correct /Users#index/ palceholder text' do
      get users_path
      expect(response.body).to include('Here is a list of all users')
    end

    it 'contains correct /Users#show/ palceholder text' do
      get user_path(1)
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end
end
