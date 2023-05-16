require 'rails_helper'

describe 'Post index page', type: :feature do
  before :each do
    @user = User.create(name: 'Neo', photo: 'neo.jpg', bio: 'The One')
    @post = Post.create(author: @user, title: 'Awakening', text: 'I choose the red pill')
    @post_two = Post.create(author: @user, title: 'Training', text: 'I know kung fu')
    @post_three = Post.create(author: @user, title: 'The Oracle', text: 'There is no spoon')
    @post_four = Post.create(author: @user, title: 'Choice', text: 'I believe I can save Morpheus')
    @post_five = Post.create(author: @user, title: 'Agent encounter', text: 'still only human')
    @comment = Comment.create(post: @post, author: @user, text: 'time to wake up')
    @comment_two = Comment.create(post: @post_two, author: @user, text: 'time to fight')
    visit user_posts_path(@user)
  end

  it 'shows the user profile picture' do
    expect(page).to have_css("img[src='#{@user.photo}']")
  end

  it 'shows the username of the user' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the number of posts for the user' do
    expect(page).to have_content(@user.posts_counter)
  end

  it 'shows the title of posts' do
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post_four.title)
  end

  it 'shows some of the posts text' do
    expect(page).to have_content(@post_two.text)
    expect(page).to have_content(@post_three.text)
  end

  it 'shows the first comments of a post' do
    expect(page).to have_content(@comment.text)
    expect(page).to have_content(@comment_two.text)
  end

  it 'shows the number of comments and likes for each post' do
    expect(page).to have_content(@post.comments_counter)
    expect(page).to have_content(@post_four.comments_counter)
    expect(page).to have_content(@post_two.likes_counter)
    expect(page).to have_content(@post_three.likes_counter)
  end

  it 'has no pagination for five posts or less' do
    expect(page).not_to have_selector('nav.pagination')
  end

  it 'redirects to post show page of a clicked post' do
    click_link @post.title
    expect(page).to have_current_path(user_post_path(@user, @post))
  end

  it 'redirects to post show page of a clicked post' do
    click_link @post_two.title
    expect(page).to have_current_path(user_post_path(@user, @post_two))
  end

  context 'when there are more than 5 posts' do
    before :each do
      @post_six = Post.create(author: @user, title: 'Resurrection', text: 'I am the One')
      visit user_posts_path(@user)
    end

    it 'has pagination' do
      expect(page).to have_selector('nav.pagination')
    end
  end
end
