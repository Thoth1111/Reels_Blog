require 'rails_helper'

describe User, type: :model do
  subject { User.create(name: 'Soap McTavish', photo: 'Soap_MacTavish.jpg', bio: 'Spec-Ops') }
  let(:post) { Post.create(title: 'Track Al Asad', author: subject, text: 'Capture Al Asad from the TV station') }

  describe 'validations' do
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'posts_counter should be greater than or equal to 0' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end
    it 'posts_counter should be an integer' do
      subject.posts_counter = 1.5
      expect(subject).to_not be_valid
    end
  end
  describe '#initialize' do
    it 'should be valid' do
      expect(subject).to be_valid
    end
    it 'should have a name' do
      expect(subject.name).to eq('Soap McTavish')
    end
    it 'should have a photo' do
      expect(subject.photo).to eq('Soap_MacTavish.jpg')
    end
    it 'should have a bio' do
      expect(subject.bio).to eq('Spec-Ops')
    end
  end
  describe '#recent_three' do
    it 'should return up to three of the most recent posts' do
      post.save
      expect(subject.recent_three).to eq([post])
    end
  end
end
