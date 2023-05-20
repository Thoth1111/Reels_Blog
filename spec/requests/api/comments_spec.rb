require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    post 'Creates a comment' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          text: { type: :string },
          post_id: { type: :integer },
          user_id: { type: :integer }
        },
        required: ['text']
      }

      response '201', 'comment created' do
        let(:comment) { { text: 'new comment' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { text: '' } }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    get 'Retrieves all comments' do
      tags 'Comments'
      produces 'application/json', 'application/xml'

      parameter name: :post_id, in: :path, type: :string

      response '200', 'comments found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 text: { type: :string },
                 post_id: { type: :integer },
                 user_id: { type: :integer },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               },
               required: %w[id text user_id created_at updated_at post_id]

        let(:post_id) { 10 }
        run_test!
      end
    end
  end
end
