class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(
      :postal_code, :city_id, :town, :house_number, :building, :tell
    ).merge(user_id: current_user.id, item_id: @item.id)
  end
end