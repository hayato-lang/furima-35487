class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_order, only: [:index, :create]
  before_action :user_authentication, only: [:index, :create]
  def index 
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_params)
    if @order_shipping.valid?
      @order_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_shipping).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number,).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def user_authentication
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
