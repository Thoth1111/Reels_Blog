require 'rails_helper'

describe 'Post show page', type: :feature do
  before :each do
    @user = User.create(name: 'Neo', photo: 'neo.jpg', bio: 'The One')
    @post = Post.create(author: @user, title: 'Awakening', text: 'I choose the red pill')
    @comment = Comment.create(author: @user, post: @post, text: 'Time to unplug')
    visit user_post_path(@user, @post)
  end
  it 'shows the title of the post' do
    expect(page).to have_content(@post.title)
  end

  it 'shows the author of the post' do
    expect(page).to have_content(@post.author.name)
  end

  it 'shows the number of comments and likes for the post' do
    expect(page).to have_content(@post.comments_counter)
    expect(page).to have_content(@post.likes_counter)
  end

  it 'shows the body of the post' do
    expect(page).to have_content(@post.text)
  end

  it 'shows the username of a commenter and their comment' do
    expect(page).to have_content(@comment.author.name)
    expect(page).to have_content(@comment.text)
  end
end
