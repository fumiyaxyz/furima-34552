class OrdersController < ApplicationController
  before_action :move_to_login
  before_action :block

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(get_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
    def get_params
      params.require(:order_address).permit(:postal_code,:prefecture_id,:city,:house_number,:building_number,:phone_number).merge(token: params[:token], user_id:  current_user.id,item_id: params[:item_id])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,  # 商品の値段
        card: get_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

    def move_to_login
      unless user_signed_in?
        redirect_to  user_session_path
      end
    end
  
    def block
      if current_user.id == Item.find(params[:item_id]).user_id
        redirect_to root_path 
      end
    end
end
