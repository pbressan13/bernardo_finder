class Service < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :bookings

  validates :title, uniqueness: true

  IMAGES = {
    "Churrasco" => "https://images.unsplash.com/photo-1560614382-33bd4daa1b9e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2370&q=80",
    "Toca pagode" => "https://images.unsplash.com/photo-1563980337510-bfdd2649a4bc?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=987&q=80"
  }
end
