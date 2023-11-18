class Product < ApplicationRecord
  geocoded_by :pickup_address
  after_validation :geocode, if: :will_save_change_to_pickup_address?

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
  against: [ :name, :description ],
  using: {
    tsearch: { prefix: true }
  }

  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :pickup_address, presence: true

  has_one_attached :image
  has_many :favorites
end
