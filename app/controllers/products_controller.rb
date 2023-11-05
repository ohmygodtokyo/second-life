class ProductsController < ApplicationController

  before_action :set_product, only: [:show]

  def index
    @products = Product.allocate
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
