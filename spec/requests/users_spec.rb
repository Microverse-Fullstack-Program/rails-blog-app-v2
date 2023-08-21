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
    it 'renders the index template' do
      get '/users/index'
      expect(response).to render_template('index')
    end

    it 'renders the show template' do
      get '/users/show'
      expect(response).to render_template('show')
    end
  end

  describe 'response body' do
    it 'contains correct /Users#index/ palceholder text' do
      get '/users/index'
      expect(response.body).to match(/Users#index/)
    end

    it 'contains correct /Users#show/ palceholder text' do
      get '/users/show'
      expect(response.body).to match(/Users#show/)
    end
  end
end
