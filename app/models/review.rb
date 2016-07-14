class Review < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :restaurant, required: true

  validates :rating, inclusion:(1..5)
end
