require 'rails_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name of less than 3 characters' do
    restaurant = Restaurant.new(name: "kf", user_id: 1)
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it { should validate_uniqueness_of(:name) }

  # describe 'reviews' do
  #   describe 'build_with_user' do
  #
  #     let(:user) { User.create email: 'test@test.com' }
  #     let(:restaurant) { Restaurant.create name: 'Test' }
  #     let(:review_params) { {thoughts: 'yum', rating: 5} }
  #
  #     subject(:review) { restaurant.reviews.build_with_user(review_params, user) }
  #
  #     it 'builds a review' do
  #       expect(review).to be_a Review
  #     end
  #
  #     it 'builds a review associated with the specified user' do
  #       expect(review.user).to eq user
  #     end
  #
  #   end
  # end


end
