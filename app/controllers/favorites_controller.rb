class FavoritesController < ApplicationController
  def create
    favorite = Favorite.new(favorite_params)
    favorite.save
    redirect_to root_path
  end

  def destroy
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    favorite.destroy
    redirect_to root_path
  end

  private
    def favorite_params
      params.permit().merge(user_id: current_user.id, item_id: params[:item_id])
    end
end
