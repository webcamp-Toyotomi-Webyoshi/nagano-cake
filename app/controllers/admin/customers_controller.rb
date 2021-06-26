class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def authenticate
    redirect_to admin_seesion_path unless admin_signed_in?
  end

  def index
    @customers = Customer.all
  end

  def show
     @customer = Customer.find(params[:id])
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  def update
     @customer = Customer.find(params[:id])
     @customer.update(customer_params)
     redirect_to admin_customers_path
  end

 private
  def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
                                      :post_cord, :address, :telephone, :customer_status )
  end
end
