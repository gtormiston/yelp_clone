require 'rails_helper'

feature 'User can sign in and out' do

  context 'user not signed in and on the homepage' do
    it 'should see a signin link and a signup link' do
      visit '/'
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end

    it 'should not see "sign out" link' do
      visit '/'
      expect(page).not_to have_link('Sign Out')
    end

    it 'should not see add new restaurant link' do
      visit '/'
      expect(page).not_to have_link 'Add a restaurant'
    end

  end

  context 'user signed in on homepage' do
    before do
      visit '/'
      click_link 'Sign Up'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Sign up'
    end

    it 'should see "sign out" link' do
      visit '/'
      expect(page).to have_link('Sign Out')
    end

    it 'should not see a sign in link and a sign up link' do
      visit '/'
      expect(page).not_to have_link('Sign In')
      expect(page).not_to have_link('Sign Up')
    end

    it 'should see create restaurant link' do
      visit '/'
      expect(page).to have_link 'Add a restaurant'
    end
  end

end
