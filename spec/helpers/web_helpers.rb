def sign_up(email = 'test@test.com', password = 'password', password_confirmation = 'password')
  visit '/'
  click_link 'Sign Up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email = 'test@test.com', password = 'password')
  visit '/'
  click_link 'Sign In'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Sign in'
end

def add_restaurant(name = 'KFC', description = 'Super good chicken')
  visit '/'
  click_link 'Add a restaurant'
  fill_in 'Name', with: name
  fill_in 'Description', with: description
  click_button 'Create Restaurant'
end

def add_review(name, thoughts, rating)
  visit '/'
  click_link "Review #{name}"
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end
