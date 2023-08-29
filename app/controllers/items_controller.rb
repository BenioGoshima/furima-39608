class ItemsController < ApplicationController
  def index
    
  end

  def create
    @item = Item.new(item_params)
  end
end
