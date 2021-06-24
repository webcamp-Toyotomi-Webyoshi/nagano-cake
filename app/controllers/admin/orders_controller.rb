class Admin::OrdersController < ApplicationController

  def index
   @orders = Order.all
  end

  def customer_index
   @customer = Customer.find(params[:id])
  end

  def show
   @order = Order.find(params[:id])
   @order_items = @order.order_items
  end

  def update
   @order = Order.find(params[:id])
   @order.update(order_params)
   redirect_to admin_order_path
  end

  private

  def order_params
   params.require(:order).permit(:order_status)
  end

  def order_item_params
   params.require(:order_item).permit(:production_status)
  end
end
