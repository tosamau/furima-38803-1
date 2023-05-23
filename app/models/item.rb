class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :ship_from
  belongs_to :shipping_day 

  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :ship_from_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
end


