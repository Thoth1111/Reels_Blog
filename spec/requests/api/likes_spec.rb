require 'swagger_helper'

RSpec.describe 'api/likes', type: :request do
    path '/api/v1/users/{user_id}/posts/{post_id}/likes' do
        get 'Retrieves all likes' do
            tags 'Likes'
            produces 'application/json, application/xml'

            parameter name: :post_id, in: :path, type: :string

            response '200', 'likes found' do
                schema type: :object,
                    properties: {
                        id: { type: :integer },
                        user_id: { type: :integer },
                        post_id: { type: :integer },
                        created_at: { type: :string }
                    },
                    required: %w[id user_id post_id, created_at]
                
                let(:post_id) { 9 }
                run_test!
            end
        end
    end
    path 'api/v1/users/{user_id}/posts/{post_id}/likes' do
        post 'Creates a like' do
            tags 'Likes'
            consumes 'application/json'
            parameter name: :like, in: :path, type: :string

            response '201', 'like created' do
                let(:like) { { user_id: 1, post_id: 9 } }
                run_test!
            end

            response '422', 'invalid request' do
                let(:like) { { user_id: 1, post_id: 9 } }
                run_test!
            end
        end
    end
end

