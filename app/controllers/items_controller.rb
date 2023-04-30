class ItemsController < ApplicationController
  #before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:item_name,:description, :category_id, :condition_id, :shipping_fee_id, :ship_from_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  #def move_to_index
    #return if user_signed_in?

    #redirect_to action: :index
  #end
end

