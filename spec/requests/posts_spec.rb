require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/posts/index'
      expect(response.status).to eq(200
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/posts/show'
      expect(response.status).to eq(200
    end
  end

  describe 'Template rendering' do
    it 'renders the index template' do
      get '/posts/index'
      expect(response).to render_template('index')
    end

    it 'renders the show template' do
      get '/posts/show'
      expect(response).to render_template('show')
    end
  end

  describe 'response body' do
    it 'contains correct /Posts#index/ palceholder text' do
      get '/posts/index'
      expect(response.body).to match(/Posts#index/)
    end

    it 'contains correct /Posts#show/ palceholder text' do
      get '/posts/show'
      expect(response.body).to match(/Posts#show/)
    end
  end
end
