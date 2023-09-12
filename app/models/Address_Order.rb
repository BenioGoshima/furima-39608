class AddressOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :item_id, :user_id

  varidates :postal_code,    presence: true
  varidates :prefecture_id,  numericality: { other_than: 1 }
  varidates :municipalities, presence: true
  varidates :house_number,   presence: true
  varidates :building_name,
  varidates :phone_number,   presence: true

  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number, item_id: item_id, user_id: user_id)
  end

end