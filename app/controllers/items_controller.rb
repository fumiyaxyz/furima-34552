class ItemsController < ApplicationController
  before_action :move_to_login, except: [:index,:show]
  before_action :get_params, only:[:edit,:update,:show]
  before_action :block, only:[:edit,:update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to  item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :ship_days_id,
                                 :price).merge(user_id: current_user.id)
  end

  def move_to_login
    unless user_signed_in?
      redirect_to  user_session_path
    end
  end

  def get_params
    @item = Item.find(params[:id])
  end

  def block
    unless current_user.id == @item.user_id
      redirect_to root_path 
    end
  end

end
