require 'rails_helper'

describe Comment, type: :model do
  let(:user) { User.create(name: 'Soap McTavish', photo: 'Soap_MacTavish.jpg', bio: 'Spec-Ops') }
  let(:post) { Post.create(author: user, title: 'Track Al Asad', text: 'Capture Al Asad from the TV station') }
  subject { Comment.create(post:, author: user, text: 'Assault begins at 1100 hrs') }

  describe '#initialize' do
    it 'should be associated with a post' do
      expect(subject.post).to eq(post)
    end
    it 'should be associated with an author' do
      expect(subject.author).to eq(user)
    end
    it 'should have the text' do
      expect(subject.text).to eq('Assault begins at 1100 hrs')
    end
  end
  describe '#update_posts_counter' do
    before { subject.save }
    it 'should update the post comments_counter' do
      expect(post.comments_counter).to eq(1)
    end
  end
end
