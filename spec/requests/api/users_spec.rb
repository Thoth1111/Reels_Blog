require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
    path '/api/v1/users' do
        get 'Retrieves all users' do
            tags 'Users'
            produces 'application/json'
            
            response '200', 'users found' do
                schema type: :array,
                    items: {
                        type: :object,
                        properties: {
                            id: { type: :integer },
                            name: { type: :string },
                            email: { type: :string },
                            bio: { type: :string},
                            created_at: { type: :string },
                            updated_at: { type: :string }
                        },
                        required: %w[id name email created_at updated_at]
                    }

                    run_test!
                end
            end
        end
    end
    path '/api/v1/users' do
        post 'Creates a user' do
            tags 'Users'
            consumes 'application.json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    name: {type: :string},
                    email: {type: :string},
                    password: {type: :string}
                }
                required: ['name', 'email', 'password']
            }

            response '201', 'user created' do
                let(:user) { {name: 'Soap', email: 'soap@soap.com', , password: 'soap141'} }
                run_test!
            end
            
            respond '422', 'invalid request' do
                let(:user) {name: 'test'}
                run_test!
            end
        end
    end
    path '/api/v1/users/{id}' do
        delete 'Deletes a user' do
            tags 'Users'
            consumes 'application/json'
            parameter name: :id, in: :path, type: :integer

            response '204', 'user deleted' do
                let(:id) { 4 }
                run_test!
            end
            response '404', 'user not found' do
                

