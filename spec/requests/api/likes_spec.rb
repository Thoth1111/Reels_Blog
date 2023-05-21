require 'swagger_helper'

RSpec.describe 'api/likes', type: :request do
    path '/api/v1/users/{user_id}/posts/{post_id}/likes' do
        get 'Retrives all likes' do
            tags 'Likes'
            produces 'application/json'

            parameter :user_id, in: :path, type: :string :post_id, in: :path, type: :string

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
end

