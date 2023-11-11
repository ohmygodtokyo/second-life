class ProductsController < ApplicationController

  before_action :set_product, only: [:show]

  def index
    @products = Product.all
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
      redirect_to products_path(@products), notice: 'Product was successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: 'Product could not be created.'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
