class OrdersController < ApplicationController
  
  def index
    @order_address = OrderAddress.new
    @product = Product.find(params[:product_id])
  end

  def create
  end

end