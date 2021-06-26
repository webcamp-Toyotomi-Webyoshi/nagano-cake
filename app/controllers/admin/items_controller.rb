class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  PER = 6

  def authenticate
    redirect_to admin_seesion_path unless admin_signed_in?
  end

  def index
    @items = Item.page(params[:page]).per(PER)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item.id)
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item.id)
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :is_active, :genre_id)
  end

end
