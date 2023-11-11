class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @product = Product.find(params[:product_id])
    @booking = Booking.new
  end

  def create
    @product = Product.find(params[:product_id])
    @booking = @product.bookings.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: 'Booking could not be created.'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :product_id)
  end
end
