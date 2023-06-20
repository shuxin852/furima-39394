class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @order_form = OrderForm.new
    if @item.user == current_user
      redirect_to root_path
    elsif @item.present?
      redirect_to root_path
    end
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def order_form_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_form_params[:token],
      currency: 'jpy'
    )
  end
end
