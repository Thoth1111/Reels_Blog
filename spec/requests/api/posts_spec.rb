require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
    path '/api/v1/users/{user_id}/posts' do
        get 'Retrieves all posts' do
            tags 'Posts'
            produces 'application/json', 'application/xml'
        
            parameter name: :user_id, in: :path, type: :string
        
            response '200', 'posts found' do
                schema type: :object,
                properties: {
                    id: { type: :integer },
                    title: { type: :string },
                    text: { type: :string },
                    user_id: { type: :integer },
                    created_at: { type: :string },
                    updated_at: { type: :string },
                    comments: { type: :array },
                    likes: { type: :array }
                },
                required: [ 'id', 'title', 'text', 'user_id', 'created_at', 'updated_at', 'comments', 'likes' ]
        
                let(:user_id) {7}
                run_test!
            end
        end
    end
end
