require 'rails_helper'

describe 'Posts', type: :request do
  let(:user) { User.create(name: 'Neo', photo: 'Neo.jpg', bio: 'The one') }
  let(:post) { Post.create(author: user, title: 'Awakening', text: 'There is no spoon') }

  describe 'GET #index' do
    before do
      get user_posts_path(user)
    end

    it 'returns correct response status' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before do
      get user_post_path(user, id: post.id)
    end

    it 'returns correct response status' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end
end
