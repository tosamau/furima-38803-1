class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :ship_from
  belongs_to :shipping_day 

  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true
  validates :description, presence: true
  validates :shipping_fee_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :ship_from_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :price, presence: true
end


