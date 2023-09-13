class OrdersController < ApplicationController
  def index
    @items = Item.find(params[:item_id])
  end

  def show
    
  end


  def new
    @address_order = AddressOrder.new
  end

  def create
    @address_order =AddressOrder.new(order_params)
    if @address_order.valid?
      @address_order.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:address_order).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token])
  end
end
