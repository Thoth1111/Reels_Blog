require 'rails_helper'

describe 'User show page', type: :feature do
    before :each do
        @user = User.create(name: 'Neo', photo: 'neo.jpg', bio: 'The One')
        @post = Post.create(author: @user, title: 'Awakening', text: 'I choose the red pill')
        @post_2 = Post.create(author: @user, title: 'Training', text: 'I know kung fu')
        @post_3 = Post.create(author: @user, title: 'The Oracle', text: 'There is no spoon')
        @post_4 = Post.create(author: @user, title: 'Choice', text: 'I believe I can save Morpheus')
        visit user_path(@user)
    end

    it 'shows user info' do
        expect(page).to have_content(@user.name)
        expect(page).to have_css("img[src='#{@user.photo}']")
        expect(page).to have_content(@user.posts_counter)
        expect(page).to have_content(@user.bio)
        expect(page).to have_content(@post_2.title)
        expect(page).to have_content(@post_3.title)
        expect(page).to have_content(@post_4.title)
        expect(page).to have_button('See all posts')
    end

    it 'redirects to post page' do
        click_link @post_2.title
        expect(page).to have_current_path(user_post_path(@user, @post_2))
    end

    it 'redirects to post_2 page' do
        click_link @post_3.title
        expect(page).to have_current_path(user_post_path(@user, @post_3))
    end

    it 'redirects to all posts page' do
        click_link 'See all posts'
        expect(page).to have_current_path(user_posts_path(@user))
    end
end
