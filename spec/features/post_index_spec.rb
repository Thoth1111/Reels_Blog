require 'rails_helper'

describe 'Post index page', type: :feature do
    before :each do
        @user = User.create(name: 'Neo', photo: 'neo.jpg', bio: 'The One')
        @post = Post.create(author: @user, title: 'Awakening', text: 'I choose the red pill')
        @post_2 = Post.create(author: @user, title: 'Training', text: 'I know kung fu')
        @post_3 = Post.create(author: @user, title: 'The Oracle', text: 'There is no spoon')
        @post_4 = Post.create(author: @user, title: 'Choice', text: 'I believe I can save Morpheus')
        @post_5 = Post.create(author: @user, title: 'Agent encounter', text: 'still only human')
        @comment = Comment.create(post: @post, author: @user, text: 'time to wake up')
        @comment_2 = Comment.create(post: @post_2, author: @user, text: 'time to fight')
        visit user_posts_path(@user)
    end

    context 'five posts or less' do
        it 'shows posts info' do
            expect(page).to have_content(@user.name)
            expect(page).to have_css("img[src='#{@user.photo}']")
            expect(page).to have_content(@user.posts_counter)
            expect(page).to have_content(@post.title)
            expect(page).to have_content(@post_4.title)
            expect(page).to have_content(@post_2.text)
            expect(page).to have_content(@post_3.text)
            expect(page).to have_content(@comment.text)
            expect(page).to have_content(@comment_2.text)
            expect(page).to have_content(@post.comments_counter)
            expect(page).to have_content(@post_4.comments_counter)
            expect(page).to have_content(@post_2.likes_counter)
            expect(page).to have_content(@post_3.likes_counter)
        end
    end

    context 'more than five posts' do
        
