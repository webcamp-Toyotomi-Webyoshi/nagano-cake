class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @cart_item = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    if params[:addresses] == "address"
      @order.post_cord = current_customer.post_cord
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    elsif params[:addresses] == "addresses"
      @address = Address.find(params[:order][:customer_id])
      @order.post_cord = @address.post_cord
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:addresses] == "address_new"
      @address = Address.new
      @address.post_cord = @order.post_cord
      @address.address = @order.address
      @address.name = @order.name
      @address.save
    else
      @order = Order.new
      render 'new'
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart|
      @order_item = OrderItem.new
      @order_item.item_id = cart.item.id
      @order_item.order_id = @order.id
      @order_item.item_quantity = cart.amount
      @order_item.price = cart.item.price
      @order_item.save
    end
    current_customer.cart_items.destroy_all
    render :complete

  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items

  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :address, :post_cord, :name, :postage, :total_payment, :status, :item_quantity )
  end
end