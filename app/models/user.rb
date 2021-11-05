class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  has_one_attached :avatar
  has_many :services
  has_many :bookings

  def self.from_omniauth(auth)
    # name_split = auth.info.name.split
    user = User.where(email: auth.info.email).first
    puts auth.info.image
    user ||= User.create!(provider: auth.provider, uid: auth.uid, name: auth.info.name, avatar: auth.info.image,
                          email: auth.info.email, password: Devise.friendly_token[0, 20])
    user
  end
end
