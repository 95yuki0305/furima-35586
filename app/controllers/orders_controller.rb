class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_address = OrderAddress.new
    @product = Product.find(params[:product_id])
    if current_user == @product.user
      redirect_to root_path
    elsif @product.order.present?
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
      @product = Product.find(params[:product_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    @product = Product.find(params[:product_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.selling_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end