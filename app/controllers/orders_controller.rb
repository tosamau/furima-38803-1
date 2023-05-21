class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(order_params)
    #binding.pry
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end


  private
  def order_params
    params.require(:order_address).permit(:post_code, :ship_from_id, :city_name, :house_number, :building_name, :phone_number, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_7a321a0fe83d1c43f3c13045"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: item.price,  
      card: order_params[:token],    
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
