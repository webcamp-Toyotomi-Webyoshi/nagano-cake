class Public::HomesController < ApplicationController
  def top
    @items = Item.last(3)
  end
end
