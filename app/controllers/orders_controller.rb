class OrdersController < ApplicationController
  def index
    @items = Item.find(params[:item_id])
  end

  def show
    
  end


  def new
    @item = Item.find(params[:item_id])
  end
end
