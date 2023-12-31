class Item < ApplicationRecord
  validates :trade_name,    presence: true
  validates :description,   presence: true
  validates :category_id,   numericality: { other_than: 1 }
  validates :condition_id,  numericality: { other_than: 1 }
  validates :postage_id,    numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :date_id,       numericality: { other_than: 1 }
  validates :price,         presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validate  :price_must_be_integer

  validates :image,         presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :condition
    belongs_to :postage
    belongs_to :prefecture
    belongs_to :delivery_time, class_name: 'DeliveryTime', foreign_key: 'date_id'

  private

  def price_must_be_integer
    price.present? && !price.is_a?(Integer)
  end
end
