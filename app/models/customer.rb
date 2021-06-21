class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  
  def full_name
    self.first_name + self.last_name
  end

  def full_name_kana
    self.first_name_kana + self.last_name_kana
  end

  def customer_status_for_authentication?
    super && (self.customer_status == false)
  end
end
