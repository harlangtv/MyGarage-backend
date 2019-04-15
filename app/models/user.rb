class User < ApplicationRecord
  has_many :listings
  has_many :bids
  has_many :auctions
  has_many :comments

  validates :username, uniqueness: true
  has_secure_password
end
