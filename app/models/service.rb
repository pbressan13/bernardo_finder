class Service < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :bookings

  validates :title, uniqueness: true
end
