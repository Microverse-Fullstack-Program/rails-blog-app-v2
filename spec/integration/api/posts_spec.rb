require 'swagger_helper'

RSpec.describe 'api/post', type: :request do
  path '/api/posts' do
    post 'Create a post' do
      tags 'Posts'
      consumes 'application/json'
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          text: { type: :string }
        },
        required: %w[title text]
      }

      response '201', 'post created' do
        let(:post) { { title: 'foo', text: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:post) { { title: 'foo' } }
        run_test!
      end
    end
  end
end
