class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @addresses = current_customer.addresses
    if @address.save
      redirect_to addresses_path
      flash[:success] = "配送先情報を追加しました"
    else
      render 'index'
      flash[:success] = "情報正しく入力してくだちぃ"
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
      flash[:success] = "配送先情報を変更しました"
    else
      render 'index'
    end
  end

  def destroy
    @addresses = current_customer.addresses
    @address = Address.find(params[:id])
    if @address.destroy
      flash[:success] = "配送先情報を削除しました"
      redirect_to addresses_path
    end
  end


  private

  def address_params
    params.require(:address).permit(:post_cord, :address, :name)
  end

end