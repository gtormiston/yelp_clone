require 'rails_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name of less than 3 characters' do
    restaurant = Restaurant.new(name: "kf", user_id: 1)
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it { should validate_uniqueness_of(:name) }
end
