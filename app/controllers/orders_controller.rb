class OrdersController < ApplicationController
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
      Payjp.api_key = "sk_test_b5d9dd4b089c3cd7508566d5"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,  # 商品の値段
        card: get_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
end
