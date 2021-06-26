class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def authenticate
    redirect_to admin_seesion_path unless admin_signed_in?
  end
  
  def update
   order_item = OrderItem.find(params[:id])
   order = order_item.order
   order_item.update(order_item_params)
   redirect_to admin_order_path(order.id)
  end

  private
  def order_item_params
   params.require(:order_item).permit(:production_status)
  end
end
