class Public::CustomersController < ApplicationController
  def show
   @customer = Customer.find(params[:id])
  end

  def edit
   @customer = current_customer
  end

  def update
   @customer = current_customer
   @customer.update(customer_params)
   redirect_to customer_path(@customer)
  end
  
  def unsubscribe
    @user = User.find_by(name: params[:name])
  end

  def withdraw
    @user = User.find_by(name: params[:name])
    @user.update(customer_status: "有効")
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
   params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                    :post_cord, :address, :telephone, :customer_status )
  end
end
