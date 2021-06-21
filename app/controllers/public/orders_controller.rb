class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_customer.address
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to new_order_path
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :post_cord, :address, :name)
  end
end
