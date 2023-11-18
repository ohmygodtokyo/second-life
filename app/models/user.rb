class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :products
  has_many :bookings

  def current_user_pending_booking
    # bookings.pending.first
    # bookings.where(status: "pending").first
    bookings.find_by(status: "pending")
  end

  has_many :favorites
  has_many :favorite_products, through: :favorites, source: :product
end
