require 'swagger_helper'

RSpec.describe 'api/comment', type: :request do
  path '/api/users/{user_id}/posts/{post_id}/comments' do
    post 'Create a comment' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string }
        },
        required: %w[text]
      }

      response '201', 'comment created' do
        let(:comment) { { text: 'foo' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { text: '' } }
        run_test!
      end
    end
  end

  path '/api/users/{user_id}/posts/{post_id}/comments' do
    get 'Get all comments' do
      tags 'Comments'
      consumes 'application/json'

      response '200', 'comments found' do
        run_test!
      end
    end
  end
end
