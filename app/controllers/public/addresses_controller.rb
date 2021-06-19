class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end
  # current_customerが必要だっちゃ！

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path, notice: '配送先を追加しました'
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to address_path(@address)
      flash[:success] = "配送先情報を変更しました"
    else
      render 'index'
    end
  end
  
  # destroyが必要だっちゃ！

  private

  def address_params
    params.require(:address).permit( :post_cord, :address, :name)
  end

end