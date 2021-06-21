class Address < ApplicationRecord

  belongs_to :customer

  validates :post_cord, :address, :name, presence: true
  validates :post_cord, length: { minimum: 3, maximum: 7 }
end
