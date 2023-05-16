require 'rails_helper'

describe 'User show page', type: :feature do
  before :each do
    @user = User.create(name: 'Neo', photo: 'neo.jpg', bio: 'The One')
    @post = Post.create(author: @user, title: 'Awakening', text: 'I choose the red pill')
    @post_two = Post.create(author: @user, title: 'Training', text: 'I know kung fu')
    @post_three = Post.create(author: @user, title: 'The Oracle', text: 'There is no spoon')
    @post_four = Post.create(author: @user, title: 'Choice', text: 'I believe I can save Morpheus')
    visit user_path(@user)
  end

  it 'shows user profile picture' do
    expect(page).to have_css("img[src='#{@user.photo}']")
  end

  it 'shows username of user' do
    expect(page).to have_content(@user.name)
  end

  it 'shows the the number of posts a user has written' do
    expect(page).to have_content(@user.posts_counter)
  end

  it 'shows the bio of user' do
    expect(page).to have_content(@user.bio)
  end

  it 'shows the first three posts of the user' do
    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post_two.title)
    expect(page).to have_content(@post_three.title)
    expect(page).not_to have_content(@post_four.title)
  end

  it 'displays a button to see all posts' do
    expect(page).to have_button('See all posts')
  end

  it 'redirects to post show page of a clicked post' do
    click_link @post_two.title
    expect(page).to have_current_path(user_post_path(@user, @post_two))
  end

  it 'redirects to post show page of a clicked post' do
    click_link @post_three.title
    expect(page).to have_current_path(user_post_path(@user, @post_three))
  end

  it 'redirects to the posts index page of the user when one clicks the see all posts button' do
    click_link 'See all posts'
    expect(page).to have_current_path(user_posts_path(@user))
  end
end
