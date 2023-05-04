require 'rails_helper'

describe Post, type: :model do
  let(:user) { User.create(name: 'Soap McTavish', photo: 'Soap_MacTavish.jpg', bio: 'Spec-Ops') }
  subject { Post.create(author: user, title: 'Track Al Asad', text: 'Capture Al Asad from the TV station') }
  let(:comment) { Comment.create(post: subject, author: user, text: 'Assault begins at 1100 hrs') }

  describe 'Validations' do
    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it 'title should be less than or equal to 250 characters' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end
    it 'comments_counter should be greater than or equal to 0' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end
    it 'comments_counter should be an integer' do
      subject.comments_counter = 1.5
      expect(subject).to_not be_valid
    end
    it 'likes_counter should be greater than or equal to 0' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
    it 'likes_counter should be an integer' do
      subject.likes_counter = 1.5
      expect(subject).to_not be_valid
    end
  end
  describe '#initialize' do
    it 'should be valid' do
      expect(subject).to be_valid
    end
    it 'should have a title' do
      expect(subject.title).to eq('Track Al Asad')
    end
    it 'should have a text' do
      expect(subject.text).to eq('Capture Al Asad from the TV station')
    end
    it 'should have an author' do
      expect(subject.author).to eq(user)
    end
    it 'should have a comments_counter' do
      expect(subject.comments_counter).to eq(0)
    end
    it 'should have a likes_counter' do
      expect(subject.likes_counter).to eq(0)
    end
  end
  describe '#update_users_counter' do
    before { subject.save }

    it 'should update the author posts_counter' do
      expect(user.posts_counter).to eq(1)
    end
  end
  describe '#recent_five' do
    it 'should return up to 5 of the most recent comments' do
      comment.save
      expect(subject.recent_five).to eq([comment])
    end
  end
end
