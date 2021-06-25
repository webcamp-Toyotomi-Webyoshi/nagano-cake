class Public::HomesController < ApplicationController
  before_action :authenticate_customer!,except: [:top, :about]
  def top
    @items = Item.last(3)
  end
end
