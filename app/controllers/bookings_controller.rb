class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :approve]

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @booking = Booking.new
  end

  def create
    @product = Product.find(params[:product_id])
    @booking = @product.bookings.new(booking_params)
    @booking.user = current_user
    @booking.status = "pending"

    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render 'products/show', status: :unprocessable_entity, alert: 'Booking could not be created.'
    end
  end

  def approve
    @booking = Booking.find_by_id(params[:id])
    if @booking.update(status: "approved")
      redirect_to bookings_path, notice: 'Booking was successfully approved.'
    else
      redirect_to bookings_path, status: :unprocessable_entity, alert: 'Booking could not be approved.'
    end
  end

  def deny
    @booking = Booking.find_by_id(params[:id])
    if @booking.update(status: "denied")
      redirect_to bookings_path, notice: 'Booking was successfully denied.'
    else
      redirect_to bookings_path, status: :unprocessable_entity, alert: 'Booking could not be denied.'
    end
  end
  
  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :product_id, :status)
  end
end
