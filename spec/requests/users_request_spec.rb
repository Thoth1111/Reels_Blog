require 'rails_helper'

describe 'Users', type: :request do
  describe 'GET #index' do
    before do
      get users_path
    end

    it 'returns correct response status' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(name: 'Neo', photo: 'Neo.jpg', bio: 'The one') }

    before do
      get user_path(id: user.id)
    end

    it 'returns correct response status' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end
end
