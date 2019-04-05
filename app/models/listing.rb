class Listing < ApplicationRecord
  belongs_to :user
  has_one :auction
  has_many :comments
  has_many :images
end
