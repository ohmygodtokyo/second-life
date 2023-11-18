class FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @favorite = current_user.favorites.new(favorite_params)
    if !@favorite.save
      flash[:alert] = @favorite.errors.full_messages.to_sentence
    end

    redirect_to @favorite.product
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    product = @favorite.product
    @favorite.destroy
    redirect_to product
  end

  private

  def favorite_params
    params.require(:favorite).permit(:product_id)
  end
end
