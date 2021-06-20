# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_inactive_customer, only: [:create]
  #def after_sign_in_path_for(resource)
  #  customers_path
  #end

  def after_sign_out_path_for(resource)
    root_path
  end

  #GET /resource/sign_in
  def new
    super
  end

  #POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  def reject_inactive_customer
    @customer = Customer.find_by(params[:email])
    if @customer
      if @customer.valid_password?(params[:password]) && @customer.customer_status
        redirect_to new_customer_registration_path
      end
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana,
                                                      :post_cord, :address, :telephone, :password])
  end

end
