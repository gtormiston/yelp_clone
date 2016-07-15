require 'rails_helper'

feature 'Reviews' do

  before do
    sign_up
    add_restaurant('KFC')
  end

  context 'current user is owner' do
    scenario 'user cannot review their own restaurant' do
      click_link 'Review KFC'
      expect(page).to have_content 'You can\'t review your own restaurant!'
    end
  end

  context 'current user is not restaurant owner' do
    before do
      click_link 'Sign Out'
      sign_up('new@new.com')
    end

    scenario 'allows users to leave a review using a form' do
      click_link 'Review KFC'
      fill_in "Thoughts", with: "so so"
      select "3", from: 'Rating'
      click_button 'Leave Review'
      click_link 'KFC'
      expect(page).to have_content 'so so'
    end

    scenario 'shows reviews on the homepage' do
      click_link 'Review KFC'
      fill_in "Thoughts", with: "awesome"
      select "3", from: 'Rating'
      click_button 'Leave Review'
      expect(page).to have_content 'awesome'
    end

    scenario 'user cannot submit a review for a restaurant more than once' do
      add_review('KFC','so so','3')
      click_link 'Review KFC'
      expect(page).to have_content "You've already reviewed this restaurant!"
      end




    context 'Editing and Deleting Reviews' do

      before do
        add_review('KFC','Really enjoyed it!','5')
      end

      scenario 'users can edit their own reviews' do
        sign_in
        visit '/'
        click_link 'KFC'
        # specify block of review?
        expect(page).to have_content 'Edit Your Review'
        click_link 'Edit Your Review'
        fill_in 'Thoughts', with: 'Updated thoughts'
        select '2', from: 'Rating'
        click_link 'Update Review'
      end

      scenario 'users can delete their own reviews'

      scenario 'users can\'t edit someone elses reviews'
      scenario 'users can\'t delete their own reviews'

    end

  end


end
