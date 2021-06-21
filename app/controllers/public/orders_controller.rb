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
  end

  def index
    @orders = current_customer.orders.all
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :post_cord, :address, :name)
  end
end
