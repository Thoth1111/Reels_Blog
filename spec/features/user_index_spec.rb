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
      @user_2 = User.create(name: 'Morpheus', photo: 'morpheus.jpg', bio: 'The Captain')
      visit root_path
    end

    it 'shows users info' do
      expect(page).to have_content(@user.name)
      expect(page).to have_css("img[src='#{@user.photo}']")
      expect(page).to have_content(@user.posts_counter)
      expect(page).to have_content(@user_2.name)
      expect(page).to have_css("img[src='#{@user_2.photo}']")
      expect(page).to have_content(@user_2.posts_counter)
    end

    it 'redirects to user page' do
      click_link @user.name
      expect(page).to have_current_path(user_path(@user))
    end

    it 'redirects to user_2 page' do
        click_link @user_2.name
        expect(page).to have_current_path(user_path(@user_2))
    end
  end
end
