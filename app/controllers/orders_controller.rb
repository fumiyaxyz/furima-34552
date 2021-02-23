class OrdersController < ApplicationController
  def index
    # @item = 
    @order = Order.new
  end

  def create
    @order = Order.new(get_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
    def get_params
      params.require(:order).permit(nil).merge(user_id: current_user.id,item_id: params[:item_id])
    end
end
