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
end
