class ProductsController < ApplicationController

  before_action :set_product, only: [:show]

  def index
    @products = Product.all

    @markers = @products.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {product: product}),
        marker_html: render_to_string(partial: "marker", locals: {product: product})
      }
    end

    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @products = @products.where(sql_query, query: "%#{params[:query]}%")
    end
    @products.each do |product|
      product.instance_variable_set(:@product, product)
    end
  end

  def show
    @product = Product.find(params[:id])
    @booking = Booking.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to product_path(@product), notice: 'Product was successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: 'Product could not be created.'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :pickup_address, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
