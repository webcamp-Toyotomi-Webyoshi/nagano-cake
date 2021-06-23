class Public::ItemsController < ApplicationController
  PER = 6

  def index
    @items = Item.page(params[:page]).per(PER)
    <% if @item.is_active == true %>
      
    <% elsif @item.is_active == false %>
    
    <% end %>
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end

end
