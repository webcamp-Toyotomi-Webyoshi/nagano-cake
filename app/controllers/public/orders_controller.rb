class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
    @order = Order.new(order_params)
    @cart_item = current_customer.cart_items
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    @order.total_payment = 500
    @order.name = "ヤマぐり"
    @order.address = ""
    @order.post_cord = ""
    @order.save
    redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders.all
  end
  
  def show
    @order = Order.find(params[:id])
  end

  def complete
  end


  private
  def order_params
    params.permit(:payment_method, :address, :post_cord, :name, :postage, :total_payment )
  end
end