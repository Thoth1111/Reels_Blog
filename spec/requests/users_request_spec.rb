require 'rails_helper'

describe "Users", type: :controller do
    describe "GET #index" do
        before do
            @controller = UsersController.new
            get :index
        end

        it "returns correct response status" do
            expect(response).to have_http_status(:success)
        end

        it "renders the index template" do
            expect(response).to render_template(:index)
        end

        it "contains the correct placeholder text" do
            expect(response.body).to include("Here is a list of users:")
        end
    end
end