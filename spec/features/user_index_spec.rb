require 'rails_helper'

describe 'User index page', type: :feature do
  context 'when there are no users' do
    it 'shows no users on record' do
      visit root_path
      expect(page).to have_content('No users on record')
    end
  end

  context 'when there are users' do
    before :each do
      @user = User.create(name: 'Neo', photo: 'neo.jpg', bio: 'The One')
      @user_two = User.create(name: 'Morpheus', photo: 'morpheus.jpg', bio: 'The Captain')
      visit root_path
    end

    it 'shows usernames of all other users' do
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user_two.name)
    end

    it 'shows the profile picture for each user' do
      expect(page).to have_css("img[src='#{@user.photo}']")
      expect(page).to have_css("img[src='#{@user_two.photo}']")
    end

    it 'shows the number of posts for each user' do
      expect(page).to have_content(@user.posts_counter)
      expect(page).to have_content(@user_two.posts_counter)
    end

    it 'redirects to a user show page when a user is clicked on' do
      click_link @user.name
      expect(page).to have_current_path(user_path(@user))
    end

    it 'redirects to a user show page when a user is clicked on' do
      click_link @user_two.name
      expect(page).to have_current_path(user_path(@user_two))
    end
  end
end
