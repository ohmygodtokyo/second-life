class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def calculate_total_cost
    return nil unless start_date && end_date

    duration_in_days = (end_date - start_date).to_i

    product_price = product.price

    total_cost = duration_in_days * product_price

    return total_cost
  end
end
