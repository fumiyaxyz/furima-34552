class OrdersController < ApplicationController
  def index
    # @item = 
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(get_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
    def get_params
      params.require(:order_address).permit(:postal_code,:prefecture_id,:city,:house_number,:building_number,:phone_number).merge(user_id:  current_user.id,item_id: params[:item_id])
    end
end
