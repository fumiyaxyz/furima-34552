class ItemsController < ApplicationController
  def index
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:name,:description,:category_id,:status_id,:delivery_fee_id,:prefecture_id,:ship_days_id,:price).merge(user_id: current_user.id)
  end
end
