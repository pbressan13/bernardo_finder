class Service < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :bookings

  validates :title, uniqueness: {
    scope: :user_id,
    message: "Serviço já cadastrado."
  }

  validates :available, presence: true
  validates :available_at, presence: true
  validates :price_hour, presence: true
  validates :min_duration, presence: true
  validates :max_duration, presence: true

  IMAGES = {
    "Churrasco" => "https://images.unsplash.com/photo-1560614382-33bd4daa1b9e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2370&q=80",
    "Compras" => "https://images.unsplash.com/photo-1581646741691-6ce169c27dec?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2375&q=80",
    "Limpeza de grelhas e espetos" => "https://wildwoodgrilling.s3.amazonaws.com/wp-content/uploads/2016/03/08214843/Cleaning-Grill-S.jpg",
    "Toca pagode" => "https://www.portalabrantes.com.br/images/noticias/16159/pandeiro_insta696x696.jpg"
  }

  include PgSearch::Model
  pg_search_scope :search_by_service,
                  against: [:title],
                  using: {
                    tsearch: { prefix: true }
                  }
end
