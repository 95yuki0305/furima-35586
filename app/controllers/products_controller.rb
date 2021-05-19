class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :status_id, :shinpping_charge_id, :prefecture_id, :days_to_ship_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end
