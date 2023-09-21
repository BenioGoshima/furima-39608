class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def show
    
  end


  def new
    @address_order = AddressOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @address_order = AddressOrder.new(order_params)
    if @address_order.valid?
      Payjp.api_key = "sk_test_6fe2b0e393c911b024635ab4"
      amount = @address_order.item.price
      token = order_params[:token]

      Payjp::Charge.create(
        amount: amount,
        card: token,
        currency: 'jpy'
      )
    Address.create(address_params)
    redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :token).merge(user_id: current_user.id)
  end

  def address_params
    params.require(:address_order).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number)
  end

end
