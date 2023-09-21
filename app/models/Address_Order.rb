class AddressOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  validates :postal_code,    presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id,  numericality: { other_than: 1 }
  validates :municipalities, presence: true
  validates :house_number,   presence: true
  validates :building_name,  presence: true
  validates :phone_number,   presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true

  def save
    if valid?
      ActiveRecord::Base.transaction do
        order = Order.create(item_id: item_id, user_id: user_id)
        Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, building_name: building_name, phone_number: phone_number, item_id: item_id, user_id: user_id)
      end
    else
      false
    end
  end
end