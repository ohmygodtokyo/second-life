class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending approved denied], message: "%{value} is not a valid status" }

  def calculate_total_cost
    return nil unless start_date && end_date

    duration_in_days = (end_date - start_date).to_i

    product_price = product.price

    total_cost = duration_in_days * product_price

    return total_cost
  end

  def pending?
    status == "pending"
  end

  def approved?
    status == "approved"
  end

  def denied?
    status == "denied"
  end
end
