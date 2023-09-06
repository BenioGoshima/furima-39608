class Address < ApplicationRecord
  varidates :postal_code,    presence: true
  varidates :prefecture_id,  numericality: { other_than: 1 }
  varidates :municipalities, presence: true
  varidates :house_number,   presence: true
  varidates :building_name,
  varidates :phone_number,   presence: true

  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
end
