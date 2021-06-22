class Admin::OrdersController < ApplicationController

  def index
   @orders = Order.all
  end

  def customer_index
   @customer = Customer.find(params[:id])
  end

  def show
   #@order = Order.find(params[:id])
  end

  def update
   @order = Order.find(params[:id])
   @order.update(order_params)
   redirect_to admin_order_path
  end

  private
  def order_params
   arams.require(:order).permit(:order_status)
  end
end
