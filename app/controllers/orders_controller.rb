class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_order_address, only: [:index, :create]
  def index
    @order_address = OrderAddress.new
    if @item.user.id == current_user.id || @item.order.present?
      redirect_to root_path
    end
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
    params.require(:order_address).permit(
      :postal_code, :city_id, :town, :house_number, :building, :tell
    ).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token], 
      currency: 'jpy'
    )
  end
  def set_order_address
    @item = Item.find(params[:item_id])
  end
end
