class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_params, only: [:index, :create]

  before_action :move_to_index, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def order_params
    params.require(:order_address).permit(:post_code, :ship_from_id, :city_name, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_params
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end
end
