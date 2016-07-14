require 'rails_helper'

feature 'Reviews' do

  before do
    sign_up
    add_restaurant('KFC')
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

  xscenario 'user cannot review their own restaurant' do
    sign_in
    expect(page).not_to have_content 'Review KFC'
  end

end
