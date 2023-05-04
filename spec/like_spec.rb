require 'rails_helper'

describe Like, type: :model do
  let(:user) { User.create(name: 'Soap McTavish', photo: 'Soap_MacTavish.jpg', bio: 'Spec-Ops') }
  let(:post) { Post.create(author: user, title: 'Track Al Asad', text: 'Capture Al Asad from the TV station') }
  subject { Like.create(post:, author: user) }

  describe '#initialize' do
    it 'should be associated with a post' do
      expect(subject.post).to eq(post)
    end
    it 'should be associated with an author' do
      expect(subject.author).to eq(user)
    end
  end
  describe '#update_posts_counter' do
    before { subject.save }

    it 'should update the post likes_counter' do
      expect(post.likes_counter).to eq(1)
    end
  end
end
